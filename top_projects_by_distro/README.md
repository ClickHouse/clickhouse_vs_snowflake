# Top projects by distro

- Aims to test building a pie chart where filtering is performed a non-primary key (`distro.name`).
- Aggregates on project, counting number of downloads, where a filter is applied of `distro.name`. Performs count over last 90 days.
- Uses the top 25 distros.
- Issues a subsequent query filtering by a random timeframe (same for each).


## Queries 

## ClickHouse

```sql
-- aggregate on project when filtering on distro.name
SELECT
    project,
    count() AS c
FROM pypi
WHERE (distro.name = 'Ubuntu') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(90)))
GROUP BY project
ORDER BY c DESC
LIMIT 10

-- apply random filtering
SELECT
    project,
    count() AS c
FROM pypi
WHERE (distro.name = 'Ubuntu') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(67))) AND 
      (date <= (CAST('2023-06-23', 'Date') - toIntervalDay(62))) AND 
      (timestamp >= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(67))) AND 
      (timestamp <= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(62)))
GROUP BY project
ORDER BY c DESC
LIMIT 10
```


## Snowflake

```sql
-- aggregate on project when filtering on distro.name
SELECT project,
       count(*) AS c
FROM pypi
WHERE distro['name'] = 'Ubuntu'
  AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date))
GROUP BY project
ORDER BY c DESC
LIMIT 10;

-- apply random filtering
SELECT project,
       count(*) AS c
FROM pypi
WHERE distro['name'] = 'Ubuntu'
  AND (timestamp >= DATEADD(days, -67, '2023-06-23 08:33:59'::DateTime))
  AND timestamp <= DATEADD(days, -62, '2023-06-23 08:33:59'::DateTime)
GROUP BY project
ORDER BY c DESC
LIMIT 10;
```

## Test configurations

All tests disable the query cache with `ALTER USER <user> SET USE_CACHED_RESULT = false;` unless stated. ClickHouse query cache is also disabled and file system cache dropped first.

|      Test Config     |                                                                         ClickHouse                                                                        |                                       Snowflake                                       |
|:--------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------:|
|        default       | Default table configuration and schema for ClickHouse with  `ORDER BY (project, date, timestamp)`. No secondary index, materialized views or projections. |         Default table config and schema. No clustering or materialized views.         |
| date_project_cluster |                                                                             NA                                                                            | CLUSTER ON (to_date(timestamp), project). Automatic clustering allowed to take effect |
|   parallel_replicas  |                                                        Parallel replicas enabled to use all nodes.                                                        |                                  NA (same as default)                                 |

## Optimizations

### ClickHouse

#### Parallel Replicas

Allows all cluster compute to be used for a query i.e. all nodes used vs a single node.

```sql
SETTINGS use_hedged_requests = 0, allow_experimental_parallel_reading_from_replicas = 1, max_parallel_replicas = 100, parallel_replicas_single_task_marks_count_multiplier = 5;
```

This requires the test to be run with:

```bash
export CLICKHOUSE_SETTINGS="SETTINGS use_hedged_requests = 0, allow_experimental_parallel_reading_from_replicas = 1, max_parallel_replicas = 100, parallel_replicas_single_task_marks_count_multiplier = 5;"
```
