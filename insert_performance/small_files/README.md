# Insert Performance on small files

This test asseses the ability for Snowflake and ClickHouse to handle smaller parquet files. Snowflake [recommends a size of 150mb](https://docs.snowflake.com/en/user-guide/data-load-considerations-prepare) for optimal insert performance. ClickHouse imposes no such requirements.

We evaluate insert times for smaller files with an average size of only 10MB.

**This test was performed on 25/08/2023 for both ClickHouse (v23.8.1) and Snowflake.** 

## Assumptions

- We assume no clustering for Snowflake.
- ClickHouse uses the ordering key `(project, date, timestamp)`. This incurs a insert time overhead we consider negliable.
- We measure the insert time for Snowflake only. 
- For ClickHouse we report the insert time and time taken to reach 3000 active parts (the recommended maximum). For further details see [here](https://github.com/ClickHouse/clickhouse_vs_snowflake/blob/main/insert_performance/README.md#misc).

## Dataset

- 3 months of PYPI data
- 1.06 TB of parquet
- 109,448 files for an average size of 10MB

Located under public GCS bucket: `gs://clickhouse_public_datasets/pypi/file_downloads/2023_may_aug/`

## Schemas

Further details on these schemas can be found in the [main insert performance tests](../README.md).

### ClickHouse

Our ClickHouse schema is shown below.

```sql
CREATE TABLE default.pypi
(
    `timestamp` DateTime64(6),
    `date` Date MATERIALIZED timestamp,
    `country_code` LowCardinality(String),
    `url` String,
    `project` String,
    `file` LowCardinality(String),
    `installer` Tuple(name LowCardinality(String), version LowCardinality(String)),
    `python` LowCardinality(String),
    `implementation` Tuple(name LowCardinality(String), version LowCardinality(String)),
    `distro` Tuple(name LowCardinality(String), version LowCardinality(String), id LowCardinality(String), libc Tuple(lib Enum8('' = 0, 'glibc' = 1, 'libc' = 2), version LowCardinality(String))),
    `system` Tuple(name LowCardinality(String), release String),
    `cpu` LowCardinality(String),
    `openssl_version` LowCardinality(String),
    `setuptools_version` LowCardinality(String),
    `rustc_version` LowCardinality(String),
    `tls_protocol` LowCardinality(String),
    `tls_cipher` LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY (project, date, timestamp)
```

Note: We use `LowCardinality(String)` for the `openssl_version` and `file.type` fields instead of Enums. This was required due to the data containing values outside of the initially selected Enums. This schema is thus slightly less optimized but sufficient for this test.

### Snowflake

Our Snowflake schema:

```sql
CREATE TRANSIENT TABLE PYPI (
   timestamp TIMESTAMP,
   country_code varchar,
   url varchar,
   project varchar,
   file OBJECT,
   installer OBJECT,
   python varchar,
   implementation OBJECT,
   distro VARIANT,
   system OBJECT,
   cpu varchar,
   openssl_version varchar,
   setuptools_version varchar,
   rustc_version varchar,
   tls_protocol varchar,
   tls_cipher varchar
) DATA_RETENTION_TIME_IN_DAYS = 0;
```

## Data Loading

### ClickHouse

```sql

INSERT INTO pypi
SELECT
    timestamp,
    country_code,
    url,
    project,
    (ifNull(file.filename, ''), ifNull(file.project, ''), ifNull(file.version, ''), ifNull(file.type, '')) AS file,
    (ifNull(installer.name, ''), ifNull(installer.version, '')) AS installer,
    python AS python,
    (ifNull(implementation.name, ''), ifNull(implementation.version, '')) AS implementation,
    (ifNull(distro.name, ''), ifNull(distro.version, ''), ifNull(distro.id, ''), (ifNull(distro.libc.lib, ''), ifNull(distro.libc.version, ''))) AS distro,
    (ifNull(system.name, ''), ifNull(system.release, '')) AS system,
    cpu AS cpu,
    openssl_version AS openssl_version,
    setuptools_version AS setuptools_version,
    rustc_version AS rustc_version,
    tls_protocol,
    tls_cipher
FROM s3Cluster('default', 'https://storage.googleapis.com/clickhouse_public_datasets/pypi/file_downloads/2023_may_aug/*.parquet', 'Parquet', 'timestamp DateTime64(6), country_code LowCardinality(String), url String, project String, `file.filename` String, `file.project` String, `file.version` String, `file.type` String, `installer.name` String, `installer.version` String, python String, `implementation.name` String, `implementation.version` String, `distro.name` String, `distro.version` String, `distro.id` String, `distro.libc.lib` String, `distro.libc.version` String, `system.name` String, `system.release` String, cpu String, openssl_version String, setuptools_version String, rustc_version String,tls_protocol String, tls_cipher String')
SETTINGS input_format_null_as_default = 1, input_format_parquet_import_nested = 1, max_insert_block_size = 100000000, min_insert_block_size_rows = 100000000, min_insert_block_size_bytes = 500000000, parts_to_throw_insert = 50000, max_insert_threads = 16, parallel_distributed_insert_select=2
```


### Snowflake

```sql
create stage PYPI_STAGE_MAY_AUG
  url='gcs://clickhouse_public_datasets/pypi/file_downloads/2023_may_aug'
  storage_integration = gcs_int
  file_format = my_pypi_format;

copy into PYPI from (select
    to_timestamp($1:timestamp::varchar) as timestamp,
    $1:country_code         as country_code,
    $1:url            as url,
    $1:project            as project,
    $1:file            as file,
        $1:installer            as installer,
    $1:python             as python,
    $1:implementation            as implementation,
    $1:distro            as distro,
    $1:system       as system,
    $1:cpu            as cpu,
    $1:openssl_version      as openssl_version,
    $1:setuptools_version          as setuptools_version,

    $1:rustc_version         as rustc_version,
    $1:tls_protocol    as tls_protocol,
    $1:tls_cipher     as tls_cipher
    from @PYPI_STAGE_MAY_AUG)
pattern= 'pypi/file_downloads/2023_may_aug/file_downloads.*';
```

### Results

The following warehouse/service sizes in Snowflake and ClickHouse Cloud were used:

- `2XLARGE` Snowflake warehouse - 256 vCPUs, 512GB RAM.
- `708GB` ClickHouse Cloud service - 177 cores, 708GB RAM. 3 nodes.

|  Database  | Time to Insert (secs) | Total Load Time (secs)   |
|:----------:|:---------------------:|:------------------------:|
| ClickHouse |         4847          |           8360*          |
|  Snowflake |         11908         |           11908          |

*inc. time to 3000 parts.

#### Observations

- ClickHouse is almost 2.5x faster to perform the initial load on this dataset
- ClickHouse is 35% faster than Snowflake even when considering the time taken to merge active parts to less than the recommended number of 3000. 
- Load times for Snowflake appear to be comparable when [files are larger at around 150mb](../README.md). 
- ClickHouse appears to be faster on 10MB files than 150MB. However, these tests were conducted on a later version of 23.8.1 for which performance improvements have been made. We therefore repeated the test for 150MB files on this version of ClickHouse using the above schema. Note this dataset has fewer rows (65b vs 69b).

Results below:

|     Database    | Total Load Time (secs) * |
|:---------------:|:------------------------:|
| ClickHouse 23.6 |           11410          |
| ClickHouse 23.8 |           9480           |

While we can see total performance has improved with 23.8, this dataset takes longer to load despite having less rows in total. This suggests ClickHouse benefits from 10mb parquet files and 150mb files are prefered by Snowflake.