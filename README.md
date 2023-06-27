# ClickHouse vs Snowflake

## Load PYPI data

### ClickHouse

```sql
CREATE TABLE default.pypi
(
    `timestamp` DateTime64(6),
    `date` Date MATERIALIZED timestamp,
    `country_code` LowCardinality(String),
    `url` String,
    `project` String,
    `file` Tuple(filename String, project String, version String, type Enum8('bdist_wheel' = 0, 'sdist' = 1, 'bdist_egg' = 2, 'bdist_wininst' = 3, 'bdist_dumb' = 4, 'bdist_msi' = 5, 'bdist_rpm' = 6, 'bdist_dmg' = 7)),
    `installer` Tuple(name LowCardinality(String), version LowCardinality(String)),
    `python` LowCardinality(String),
    `implementation` Tuple(name LowCardinality(String), version LowCardinality(String)),
    `distro` Tuple(name LowCardinality(String), version LowCardinality(String), id LowCardinality(String), libc Tuple(lib Enum8('' = 0, 'glibc' = 1, 'libc' = 2), version LowCardinality(String))),
    `system` Tuple(name LowCardinality(String), release String),
    `cpu` LowCardinality(String),
    `openssl_version` LowCardinality(String),
    `setuptools_version` LowCardinality(String),
    `rustc_version` LowCardinality(String),
    `tls_protocol` Enum8('TLSv1.2' = 0, 'TLSv1.3' = 1),
    `tls_cipher` Enum8('ECDHE-RSA-AES128-GCM-SHA256' = 0, 'ECDHE-RSA-CHACHA20-POLY1305' = 1, 'ECDHE-RSA-AES128-SHA256' = 2, 'TLS_AES_256_GCM_SHA384' = 3, 'AES128-GCM-SHA256' = 4, 'TLS_AES_128_GCM_SHA256' = 5, 'ECDHE-RSA-AES256-GCM-SHA384' = 6, 'AES128-SHA' = 7, 'ECDHE-RSA-AES128-SHA' = 8)
)
ENGINE = MergeTree
ORDER BY (project, date, timestamp)

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
FROM s3Cluster('default', 'https://storage.googleapis.com/clickhouse_public_datasets/pypi/file_downloads/2023/*.parquet', 'Parquet', 'timestamp DateTime64(6), country_code LowCardinality(String), url String, project String, `file.filename` String, `file.project` String, `file.version` String, `file.type` String, `installer.name` String, `installer.version` String, python String, `implementation.name` String, `implementation.version` String, `distro.name` String, `distro.version` String, `distro.id` String, `distro.libc.lib` String, `distro.libc.version` String, `system.name` String, `system.release` String, cpu String, openssl_version String, setuptools_version String, rustc_version String,tls_protocol String, tls_cipher String')
SETTINGS input_format_parquet_import_nested = 1, input_format_parquet_import_nested = 1, max_insert_block_size = 100000000, min_insert_block_size_rows = 100000000, min_insert_block_size_bytes = 500000000, parts_to_throw_insert = 50000, max_insert_threads = 16
```

See specific sub folders for potential schema optimizations for each query type.


### Snowflake

TODO - add role, schema, warehouse setup


## Queries

### Generating queries

Requires a ClickHouse cluster with `pypi` data loaded. Generated queries are already available in sub folders.

Requires python 3.9+.

From the base folder:

```bash 
pip install -r requirements.txt
export CLICKHOUSE_HOST=localhost
export CLICKHOUSE_USER=default
export CLICKHOUSE_PASSWORD=
export CLICKHOUSE_PORT=8443

python generate-queries.py.
```

Queries will be generated into the sub folders.

### Queries

Queries consist of 6 different query types, each in their own folder, aimed to test cases where queries are part of the `ORDER BY` (ClickHouse) and `CLUSTER BY` (Snowflake) clauses and when they are not.

#### Downloads per day


#### Downloads per day by python version


#### Downloads per day by system


#### Top file types per project


#### Top projects by distro


#### Top sub projects

## Running tests

Each folder coRun for a specific folder for both systems.

### ClickHouse

```bash
./clickhouse <folder | query set> <cloud>

e.g.

./clickhouse downloads_per_day true
```

### Snowflake

```bash
./snowflake <folder | query set>

e.g.

./snowflake downloads_per_day
sed -r -e 's/^(.*)$/\1 \1 \1/' ./folder/clickhouse_queries.sql | snowsql --schemaname pypi --dbname pypi --warehouse "2XLARGE" --rolename ACCOUNTADMIN > results.txt

```

### Producing results

A summary page can be generated for each query set. Ensure you have run the tests for both ClickHouse and Snowflake and a results file has been generated for each.

```bash
./generate-results.sh <folder | query set>
```

This will produce an `index.html` file which can be opened in the target folder.