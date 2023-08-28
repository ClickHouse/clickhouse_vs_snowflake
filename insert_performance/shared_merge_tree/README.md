# Insert Performance

This test demonstrates ClickHouse Cloud's ability to linearly scale insert throughput with CPU by utilizing the ClickHouse Cloud [SharedMergeTree](https://clickhouse.com/blog/clickhouse-cloud-boosts-performance-with-sharedmergetree-and-lightweight-updates) table engine.

## Schema

We use our default ClickHouse schema but with a `SharedMergeTree` value for the `ENGINE` setting.

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
ENGINE = SharedMergeTree
ORDER BY (project, date, timestamp)
```

## Data Loading


We use our usual `INSERT INTO SELECT` data load query utilizing all available ClickHouse servers (via `s3Cluster` table funtion) and 16 insert threads per ClickHouse server (via `max_insert_threads` setting).

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
	cpu,
	openssl_version,
	setuptools_version,
	rustc_version,
	tls_protocol,
	tls_cipher
FROM s3Cluster('default', 'https://storage.googleapis.com/clickhouse_public_datasets/pypi/file_downloads/sample/2023/*.parquet', 'Parquet', 'timestamp DateTime64(6), country_code LowCardinality(String), url String, project String, `file.filename` String, `file.project` String, `file.version` String, `file.type` String, `installer.name` String, `installer.version` String, python String, `implementation.name` String, `implementation.version` String, `distro.name` String, `distro.version` String, `distro.id` String, `distro.libc.lib` String, `distro.libc.version` String, `system.name` String, `system.release` String, cpu String, openssl_version String, setuptools_version String, rustc_version String,tls_protocol String, tls_cipher String')
SETTINGS
    input_format_null_as_default = 1,
    input_format_parquet_import_nested = 1,
    max_insert_block_size = 100_000_000,
    min_insert_block_size_rows = 100_000_000,
    min_insert_block_size_bytes = 500_000_000,
    parts_to_throw_insert = 50_000,
    max_insert_threads = 16,
    parallel_distributed_insert_select=2;
```

We created the table and run the data load query on two ClickHouse Cloud services with a different number of nodes.

### Service One
- 3 nodes with a total of 177 CPU cores and 708 GB RAM
- 59 CPU cores and 236 GB RAM per node
###  Service Two
- 6 nodes with a total of 354 CPU cores and 1416 GB RAM
- 59 CPU cores and 236 GB RAM per node


## Results

We show the output from clickhouse-client executing the data load query plus the time (from the start of the data load query execution) it took to merge the part created during the ingestion to a number of 3000 active parts. The query to identify this time can be found in the [insert_performance](./insert_performance/#misc) section.

### Service One
```sql
0 rows in set. Elapsed: 6321.863 sec. Processed 65.33 billion rows, 9.60 TB (10.33 million rows/s., 1.52 GB/s.)
Peak memory usage: 27.04 GiB.
```

Time to 3000 active parts:
8017

### Service Two
```sql
0 rows in set. Elapsed: 3359.917 sec. Processed 65.33 billion rows, 9.60 TB (19.44 million rows/s., 2.86 GB/s.)
Peak memory usage: 25.97 GiB.
```
Time to 3000 active parts:
4364

Observation:

Doubling the amount of nodes and CPU cores, respectively, approximately linearly doubles the ingest throughput.
You can find more details about this in our SharedMergeTree [release blog](https://clickhouse.com/blog/clickhouse-cloud-boosts-performance-with-sharedmergetree-and-lightweight-updates).