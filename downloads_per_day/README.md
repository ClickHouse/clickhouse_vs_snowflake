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

```sql
SELECT DATE_TRUNC('DAY',timestamp) AS day, count(*) AS count FROM pypi WHERE (project = 'typing-extensions') AND (timestamp > DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY day ORDER BY day ASC;

SELECT TIME_SLICE(timestamp, 6912, 'SECOND', 'START') AS period, count(*) FROM pypi WHERE (project = 'typing-extensions') AND (timestamp >= DATEADD(days, -17, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -9, '2023-06-23 08:33:59'::DateTime) GROUP BY period ORDER BY period ASC;l
```