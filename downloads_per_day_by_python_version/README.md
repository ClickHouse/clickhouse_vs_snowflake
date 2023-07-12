# Downloads per day by Python version

- Aims to test rendering and filtering of a multi-series line chart showing downloads for a project over time.
- This test aggregates downloads by day for the last 90 days, grouping by minor python version (e.g. `3.6`) and filtering by a project. A narrower time filter is then applied to a random time frame (same random values for both databases).
- By default, this uses the 100 most popular projects, for a total of 200 queries.
- This simulates a user viewing an overview of downloads for a project grouped by minor python version (e.g. as a multi-series line chart) before drilling down on a timeframe.


## Queries 

## ClickHouse

```sql
-- per day downloads by python minor over 90 days with filtered project (varies)
SELECT
    date AS day,
    concat(splitByChar('.', python)[1], '.', splitByChar('.', python)[2]) AS major,
    count() AS count
FROM pypi
WHERE (python != '') AND (project = 'boto3') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(90)))
GROUP BY
    day,
    major
ORDER BY
    day ASC,
    major ASC

-- random filter on time period using same project as above.
SELECT
    toStartOfInterval(timestamp, toIntervalSecond(44928)) AS period,
    count() AS count,
    concat(splitByChar('.', python)[1], '.', splitByChar('.', python)[2]) AS major
FROM pypi
WHERE (python != '') AND (project = 'boto3') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(72))) AND (date <= (CAST('2023-06-23', 'Date') - toIntervalDay(20))) AND (timestamp >= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(72))) AND (timestamp <= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(20)))
GROUP BY
    period,
    major
ORDER BY
    period ASC,
    major ASC
```

## Snowflake

```sql
-- per day downloads by python minor over 90 days with filtered project (varies)
SELECT DATE_TRUNC('DAY',timestamp) AS DAY,
       SPLIT(python, '.')[0] || '.' || SPLIT(python, '.')[1] AS major,
       count(*) AS COUNT
FROM pypi
WHERE python != ''
  AND (project = 'boto3')
  AND (timestamp > DATEADD(days, -90, '2023-06-23'::Date))
GROUP BY DAY,
         major
ORDER BY DAY ASC, major ASC;

-- random filter on time period using same project as above.
SELECT TIME_SLICE(timestamp, 44928, 'SECOND', 'START') AS period,
       SPLIT(python, '.')[0] || '.' || SPLIT(python, '.')[1] AS major,
       count(*) AS c
FROM pypi
WHERE python != ''
  AND (project = 'boto3')
  AND (timestamp >= DATEADD(days, -72, '2023-06-23 08:33:59'::DateTime))
  AND timestamp <= DATEADD(days, -20, '2023-06-23 08:33:59'::DateTime)
GROUP BY period,
         major
ORDER BY period,
         major ASC;
```

## Test configurations

All tests disable the query cache with `ALTER USER <user> SET USE_CACHED_RESULT = false;` unless stated. ClickHouse query cache is also disabled and file system cache dropped first.

|      Test Config     |                                                                         ClickHouse                                                                        |                                       Snowflake                                       |
|:--------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------:|
|        default       | Default table configuration and schema for ClickHouse with  `ORDER BY (project, date, timestamp)`. No secondary index, materialized views or projections. |         Default table config and schema. No clustering or materialized views.         |
| date_project_cluster |                                                                             NA                                                                            | CLUSTER ON (to_date(timestamp), project). Automatic clustering allowed to take effect |

