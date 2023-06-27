
# Overview

- Aims to test rendering and filtering of line chart showing downloads for a project over time.
- This test aggregates downloads by day for the last 90 days, filtering by a project. A narrower time filter is in turn applied to a random time frame (same random values for both databases).
- By default, this uses the 100 most popular projects.
- This simulates a user viewing an overview of downloads for a project (e.g. as a line chart) before drilling down on a timeframe.

## Queries 

## ClickHouse

```sql
SELECT
    toStartOfDay(date),
    count() AS count
FROM pypi
WHERE (project = 'packaging') AND (date >= (CAST('2023-06-23', 'DateTime') - toIntervalDay(90)))
GROUP BY date
ORDER BY date ASC

SELECT
    toStartOfInterval(timestamp, toIntervalSecond(34560)) AS period,
    count() AS count
FROM pypi
WHERE (project = 'cryptography') AND (date >= (CAST('2023-06-23', 'Date') - toIntervalDay(87))) AND (date <= (CAST('2023-06-23 08:33:59', 'Date') - toIntervalDay(47))) AND (timestamp >= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(87))) AND (timestamp <= (CAST('2023-06-23 08:33:59', 'DateTime') - toIntervalDay(47)))
GROUP BY period
ORDER BY period ASC
```

## Snowflake

```sql
SELECT DATE_TRUNC('DAY',timestamp) AS day, count(*) AS count FROM pypi WHERE (project = 'typing-extensions') AND (timestamp > DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY day ORDER BY day ASC;

SELECT TIME_SLICE(timestamp, 6912, 'SECOND', 'START') AS period, count(*) FROM pypi WHERE (project = 'typing-extensions') AND (timestamp >= DATEADD(days, -17, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -9, '2023-06-23 08:33:59'::DateTime) GROUP BY period ORDER BY period ASC;l
```

## Test configurations


| Test Config | ClickHouse                                                                                                                                                | Snowflake                                                             |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| default     | Default table configuration and schema for ClickHouse with  `ORDER BY (project, date, timestamp)`. No secondary index, materialized views or projections. | Default table config and schema. No clustering or materialized views. |