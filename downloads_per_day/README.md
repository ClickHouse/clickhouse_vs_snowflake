
# Downloads Per Day

- Aims to test rendering and filtering of a line chart showing downloads for a project over time.
- This test aggregates downloads by day for the last 90 days, filtering by a project. A narrower time filter is then applied to a random time frame (same random values for both databases).
- By default, this uses the 100 most popular projects, for a total of 200 queries.
- This simulates a user viewing an overview of downloads for a project (e.g. as a line chart) before drilling down on a timeframe.

## Queries 

## ClickHouse

```sql
-- per day downloads over 90 days with filtered project (varies)
SELECT
    toStartOfDay(date),
    count() AS count
FROM pypi
WHERE (project = 'boto3') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(90)))
GROUP BY date
ORDER BY date ASC

-- random filter on time period using same project as above.
SELECT
    toStartOfInterval(timestamp, toIntervalSecond(34560)) AS period,
    count() AS count
FROM pypi
WHERE (project = 'typing-extensions') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(87))) AND (date <= (CAST('2023-06-23 08:33:59', 'Date') - toIntervalDay(47))) AND (timestamp >= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(87))) AND (timestamp <= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(47)))
GROUP BY period
ORDER BY period ASC
```

## Snowflake

```sql
-- per day downloads over 90 days with filtered project (varies)
SELECT DATE_TRUNC('DAY',timestamp) AS DAY,
       count(*) AS COUNT
FROM pypi
WHERE (project = 'typing-extensions')
  AND (timestamp > DATEADD(days, -90, '2023-06-23'::Date))
GROUP BY DAY
ORDER BY DAY ASC;

-- random filter on time period using same project as above.
SELECT TIME_SLICE(timestamp, 6912, 'SECOND', 'START') AS period,
       count(*)
FROM pypi
WHERE (project = 'typing-extensions')
  AND (timestamp >= DATEADD(days, -17, '2023-06-23 08:33:59'::DateTime))
  AND timestamp <= DATEADD(days, -9, '2023-06-23 08:33:59'::DateTime)
GROUP BY period
ORDER BY period ASC;
```

## Test configurations

All tests disable the query cache with `ALTER USER <user> SET USE_CACHED_RESULT = false;` unless stated. ClickHouse query cache is also disabled and file system cache dropped first.

|      Test Config     |                                                                         ClickHouse                                                                        |                                       Snowflake                                       |
|:--------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------:|
|        default       | Default table configuration and schema for ClickHouse with  `ORDER BY (project, date, timestamp)`. No secondary index, materialized views or projections. |         Default table config and schema. No clustering or materialized views.         |
|    project_cluster   |                                                                             NA                                                                            |           CLUSTER ON (project). Automatic clustering allowed to take effect.          |
| date_project_cluster |                                                                             NA                                                                            | CLUSTER ON (to_date(timestamp), project). Automatic clustering allowed to take effect |
