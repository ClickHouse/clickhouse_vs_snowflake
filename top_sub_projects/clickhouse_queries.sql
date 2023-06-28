select project, count() c FROM pypi WHERE project ILIKE '%google%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%google%' AND date >= '2023-06-23'::Date - toIntervalDay(35) AND date  <= '2023-06-23'::Date - toIntervalDay(15) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(35) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(15) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%azure%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%azure%' AND date >= '2023-06-23'::Date - toIntervalDay(59) AND date  <= '2023-06-23'::Date - toIntervalDay(20) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(59) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(20) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%boto3%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%boto3%' AND date >= '2023-06-23'::Date - toIntervalDay(36) AND date  <= '2023-06-23'::Date - toIntervalDay(13) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(36) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(13) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%requests%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%requests%' AND date >= '2023-06-23'::Date - toIntervalDay(42) AND date  <= '2023-06-23'::Date - toIntervalDay(39) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(42) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(39) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%python%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%python%' AND date >= '2023-06-23'::Date - toIntervalDay(21) AND date  <= '2023-06-23'::Date - toIntervalDay(16) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(21) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(16) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%urllib3%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%urllib3%' AND date >= '2023-06-23'::Date - toIntervalDay(25) AND date  <= '2023-06-23'::Date - toIntervalDay(19) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(25) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(19) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%botocore%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%botocore%' AND date >= '2023-06-23'::Date - toIntervalDay(85) AND date  <= '2023-06-23'::Date - toIntervalDay(32) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(85) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(32) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%setuptools%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%setuptools%' AND date >= '2023-06-23'::Date - toIntervalDay(21) AND date  <= '2023-06-23'::Date - toIntervalDay(0) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(21) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(0) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%charset%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%charset%' AND date >= '2023-06-23'::Date - toIntervalDay(41) AND date  <= '2023-06-23'::Date - toIntervalDay(29) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(41) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(29) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%typing%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%typing%' AND date >= '2023-06-23'::Date - toIntervalDay(50) AND date  <= '2023-06-23'::Date - toIntervalDay(21) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(50) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(21) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%idna%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%idna%' AND date >= '2023-06-23'::Date - toIntervalDay(28) AND date  <= '2023-06-23'::Date - toIntervalDay(10) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(28) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(10) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%certifi%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%certifi%' AND date >= '2023-06-23'::Date - toIntervalDay(52) AND date  <= '2023-06-23'::Date - toIntervalDay(21) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(52) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(21) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%s3transfer%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%s3transfer%' AND date >= '2023-06-23'::Date - toIntervalDay(65) AND date  <= '2023-06-23'::Date - toIntervalDay(45) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(65) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(45) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%awscli%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%awscli%' AND date >= '2023-06-23'::Date - toIntervalDay(82) AND date  <= '2023-06-23'::Date - toIntervalDay(23) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(82) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(23) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%six%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%six%' AND date >= '2023-06-23'::Date - toIntervalDay(89) AND date  <= '2023-06-23'::Date - toIntervalDay(17) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(89) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(17) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%importlib%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%importlib%' AND date >= '2023-06-23'::Date - toIntervalDay(62) AND date  <= '2023-06-23'::Date - toIntervalDay(28) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(62) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(28) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%pyasn1%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%pyasn1%' AND date >= '2023-06-23'::Date - toIntervalDay(18) AND date  <= '2023-06-23'::Date - toIntervalDay(15) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(18) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(15) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%pyyaml%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%pyyaml%' AND date >= '2023-06-23'::Date - toIntervalDay(17) AND date  <= '2023-06-23'::Date - toIntervalDay(12) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(17) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(12) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%grpcio%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%grpcio%' AND date >= '2023-06-23'::Date - toIntervalDay(12) AND date  <= '2023-06-23'::Date - toIntervalDay(4) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(12) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(4) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%pytest%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%pytest%' AND date >= '2023-06-23'::Date - toIntervalDay(53) AND date  <= '2023-06-23'::Date - toIntervalDay(15) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(53) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(15) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%clickhouse%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%clickhouse%' AND date >= '2023-06-23'::Date - toIntervalDay(86) AND date  <= '2023-06-23'::Date - toIntervalDay(15) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(86) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(15) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%snowflake%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%snowflake%' AND date >= '2023-06-23'::Date - toIntervalDay(33) AND date  <= '2023-06-23'::Date - toIntervalDay(0) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(33) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(0) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%mysql%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%mysql%' AND date >= '2023-06-23'::Date - toIntervalDay(83) AND date  <= '2023-06-23'::Date - toIntervalDay(70) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(83) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(70) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%elasticsearch%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%elasticsearch%' AND date >= '2023-06-23'::Date - toIntervalDay(56) AND date  <= '2023-06-23'::Date - toIntervalDay(53) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(56) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(53) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%postgres%' AND date >= '2023-06-23'::Date - toIntervalDay(90) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(90) GROUP BY project ORDER BY c DESC LIMIT 10;
select project, count() c FROM pypi WHERE project ILIKE '%postgres%' AND date >= '2023-06-23'::Date - toIntervalDay(50) AND date  <= '2023-06-23'::Date - toIntervalDay(49) AND timestamp >= '2023-06-23 08:33:59'::DateTime - toIntervalDay(50) AND timestamp  <= '2023-06-23 08:33:59'::DateTime - toIntervalDay(49) GROUP BY project ORDER BY c DESC LIMIT 10;
