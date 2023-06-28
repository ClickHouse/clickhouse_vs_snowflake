select project, count(*) c FROM pypi WHERE project ILIKE '%google%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%google%'AND (timestamp >= DATEADD(days, -35, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -15,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%azure%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%azure%'AND (timestamp >= DATEADD(days, -59, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -20,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%boto3%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%boto3%'AND (timestamp >= DATEADD(days, -36, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -13,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%requests%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%requests%'AND (timestamp >= DATEADD(days, -42, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -39,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%python%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%python%'AND (timestamp >= DATEADD(days, -21, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -16,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%urllib3%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%urllib3%'AND (timestamp >= DATEADD(days, -25, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -19,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%botocore%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%botocore%'AND (timestamp >= DATEADD(days, -85, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -32,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%setuptools%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%setuptools%'AND (timestamp >= DATEADD(days, -21, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -0,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%charset%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%charset%'AND (timestamp >= DATEADD(days, -41, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -29,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%typing%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%typing%'AND (timestamp >= DATEADD(days, -50, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -21,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%idna%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%idna%'AND (timestamp >= DATEADD(days, -28, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -10,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%certifi%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%certifi%'AND (timestamp >= DATEADD(days, -52, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -21,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%s3transfer%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%s3transfer%'AND (timestamp >= DATEADD(days, -65, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -45,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%awscli%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%awscli%'AND (timestamp >= DATEADD(days, -82, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -23,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%six%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%six%'AND (timestamp >= DATEADD(days, -89, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -17,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%importlib%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%importlib%'AND (timestamp >= DATEADD(days, -62, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -28,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%pyasn1%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%pyasn1%'AND (timestamp >= DATEADD(days, -18, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -15,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%pyyaml%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%pyyaml%'AND (timestamp >= DATEADD(days, -17, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -12,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%grpcio%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%grpcio%'AND (timestamp >= DATEADD(days, -12, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -4,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%pytest%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%pytest%'AND (timestamp >= DATEADD(days, -53, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -15,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%clickhouse%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%clickhouse%'AND (timestamp >= DATEADD(days, -86, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -15,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%snowflake%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%snowflake%'AND (timestamp >= DATEADD(days, -33, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -0,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%mysql%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%mysql%'AND (timestamp >= DATEADD(days, -83, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -70,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%elasticsearch%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%elasticsearch%'AND (timestamp >= DATEADD(days, -56, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -53,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%postgres%' AND (timestamp >= DATEADD(days, -90, '2023-06-23'::Date)) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count(*) c FROM pypi WHERE project ILIKE '%postgres%'AND (timestamp >= DATEADD(days, -50, '2023-06-23 08:33:59'::DateTime)) AND timestamp <= DATEADD(days, -49,  '2023-06-23 08:33:59'::DateTime) GROUP BY project  ORDER BY c DESC LIMIT 10;
