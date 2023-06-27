```sql
WITH 90 AS last_n_days
SELECT
    project,
    count() AS count
FROM pypi
WHERE (date > (today() - toIntervalDay(last_n_days))) AND (distro.name = 'Linux')
GROUP BY project
ORDER BY count DESC
LIMIT 10

```