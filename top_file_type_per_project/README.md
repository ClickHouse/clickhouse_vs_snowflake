# Top file types by project

- Aims to test rendering and filtering of a pie-chart showing file types for a project.
- This test aggregates file types for the last 90 days for a specific project. 
- A narrower time filter is then applied to a random time frame (same random values for both databases). This time filter is limited to a day granularity, so we can exploit materialized views in ClickHouse and Snowflake.
- By default, this uses the 100 most popular projects, for a total of 200 queries.
- This simulates a user viewing an overview of file types for a project grouped (e.g. as a pie chart) before drilling down on a timeframe.

## Queries 

## ClickHouse

```sql
-- top file types for a specific project last 90 days
SELECT
    file.type,
    count() AS c
FROM pypi
WHERE (project = 'boto3') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(90)))
GROUP BY file.type
ORDER BY c DESC
LIMIT 10

-- above query but filtered
SELECT
    file.type,
    count() AS c
FROM pypi
WHERE (project = 'boto3') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(77))) AND (date <= (CAST('2023-06-23', 'Date') - toIntervalDay(39)))
GROUP BY file.type
ORDER BY c DESC
LIMIT 10
```

## Snowflake

```sql
-- top file types for a specific project last 90 days
SELECT FILE['type'], count(*) AS c
FROM pypi
WHERE project = 'boto3'
  AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date))
GROUP BY FILE['type']
ORDER BY c DESC
LIMIT 10;

-- above query but filtered
SELECT FILE['type'], count(*) AS c
FROM pypi
WHERE project = 'boto3'
  AND (timestamp::Date >= DATEADD(days, -77, '2023-06-23'::Date))
  AND timestamp::Date <= DATEADD(days, -39, '2023-06-23'::Date)
GROUP BY FILE['type']
ORDER BY c DESC
LIMIT 10;
```

## Test configurations

All tests disable the query cache with `ALTER USER <user> SET USE_CACHED_RESULT = false;` unless stated. ClickHouse query cache is also disabled and file system cache dropped first.

|      Test Config     |                                                                         ClickHouse                                                                        |                                       Snowflake                                       |
|:--------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------:|
|        default       | Default table configuration and schema for ClickHouse with  `ORDER BY (project, date, timestamp)`. No secondary index, materialized views or projections. |         Default table config and schema. No clustering or materialized views.         |
| date_project_cluster |                                                                             NA                                                                            | CLUSTER ON (to_date(timestamp), project). Automatic clustering allowed to take effect |


