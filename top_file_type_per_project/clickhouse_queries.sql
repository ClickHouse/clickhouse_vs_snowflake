SELECT file.type, count() as c FROM pypi WHERE project = 'boto3' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'boto3' AND date >= '2023-06-23'::Date - toIntervalDay(77) AND date <= '2023-06-23'::Date - toIntervalDay(39) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'urllib3' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'urllib3' AND date >= '2023-06-23'::Date - toIntervalDay(15) AND date <= '2023-06-23'::Date - toIntervalDay(0) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'requests' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'requests' AND date >= '2023-06-23'::Date - toIntervalDay(12) AND date <= '2023-06-23'::Date - toIntervalDay(4) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'botocore' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'botocore' AND date >= '2023-06-23'::Date - toIntervalDay(87) AND date <= '2023-06-23'::Date - toIntervalDay(20) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'charset-normalizer' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'charset-normalizer' AND date >= '2023-06-23'::Date - toIntervalDay(27) AND date <= '2023-06-23'::Date - toIntervalDay(17) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'setuptools' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'setuptools' AND date >= '2023-06-23'::Date - toIntervalDay(58) AND date <= '2023-06-23'::Date - toIntervalDay(19) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'idna' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'idna' AND date >= '2023-06-23'::Date - toIntervalDay(62) AND date <= '2023-06-23'::Date - toIntervalDay(12) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'certifi' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'certifi' AND date >= '2023-06-23'::Date - toIntervalDay(45) AND date <= '2023-06-23'::Date - toIntervalDay(37) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 's3transfer' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 's3transfer' AND date >= '2023-06-23'::Date - toIntervalDay(45) AND date <= '2023-06-23'::Date - toIntervalDay(40) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'python-dateutil' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'python-dateutil' AND date >= '2023-06-23'::Date - toIntervalDay(32) AND date <= '2023-06-23'::Date - toIntervalDay(7) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'awscli' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'awscli' AND date >= '2023-06-23'::Date - toIntervalDay(88) AND date <= '2023-06-23'::Date - toIntervalDay(28) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'typing-extensions' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'typing-extensions' AND date >= '2023-06-23'::Date - toIntervalDay(61) AND date <= '2023-06-23'::Date - toIntervalDay(23) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'six' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'six' AND date >= '2023-06-23'::Date - toIntervalDay(49) AND date <= '2023-06-23'::Date - toIntervalDay(47) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyyaml' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyyaml' AND date >= '2023-06-23'::Date - toIntervalDay(50) AND date <= '2023-06-23'::Date - toIntervalDay(42) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-api-core' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-api-core' AND date >= '2023-06-23'::Date - toIntervalDay(85) AND date <= '2023-06-23'::Date - toIntervalDay(82) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'wheel' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'wheel' AND date >= '2023-06-23'::Date - toIntervalDay(78) AND date <= '2023-06-23'::Date - toIntervalDay(39) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'cryptography' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'cryptography' AND date >= '2023-06-23'::Date - toIntervalDay(58) AND date <= '2023-06-23'::Date - toIntervalDay(12) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'packaging' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'packaging' AND date >= '2023-06-23'::Date - toIntervalDay(78) AND date <= '2023-06-23'::Date - toIntervalDay(23) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'numpy' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'numpy' AND date >= '2023-06-23'::Date - toIntervalDay(34) AND date <= '2023-06-23'::Date - toIntervalDay(7) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pip' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pip' AND date >= '2023-06-23'::Date - toIntervalDay(64) AND date <= '2023-06-23'::Date - toIntervalDay(23) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'jmespath' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'jmespath' AND date >= '2023-06-23'::Date - toIntervalDay(71) AND date <= '2023-06-23'::Date - toIntervalDay(47) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'importlib-metadata' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'importlib-metadata' AND date >= '2023-06-23'::Date - toIntervalDay(67) AND date <= '2023-06-23'::Date - toIntervalDay(62) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'zipp' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'zipp' AND date >= '2023-06-23'::Date - toIntervalDay(1) AND date <= '2023-06-23'::Date - toIntervalDay(0) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'click' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'click' AND date >= '2023-06-23'::Date - toIntervalDay(40) AND date <= '2023-06-23'::Date - toIntervalDay(14) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyasn1' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyasn1' AND date >= '2023-06-23'::Date - toIntervalDay(58) AND date <= '2023-06-23'::Date - toIntervalDay(3) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'colorama' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'colorama' AND date >= '2023-06-23'::Date - toIntervalDay(49) AND date <= '2023-06-23'::Date - toIntervalDay(13) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'protobuf' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'protobuf' AND date >= '2023-06-23'::Date - toIntervalDay(34) AND date <= '2023-06-23'::Date - toIntervalDay(31) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'rsa' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'rsa' AND date >= '2023-06-23'::Date - toIntervalDay(23) AND date <= '2023-06-23'::Date - toIntervalDay(17) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'attrs' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'attrs' AND date >= '2023-06-23'::Date - toIntervalDay(63) AND date <= '2023-06-23'::Date - toIntervalDay(50) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pytz' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pytz' AND date >= '2023-06-23'::Date - toIntervalDay(60) AND date <= '2023-06-23'::Date - toIntervalDay(55) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pandas' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pandas' AND date >= '2023-06-23'::Date - toIntervalDay(66) AND date <= '2023-06-23'::Date - toIntervalDay(18) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'markupsafe' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'markupsafe' AND date >= '2023-06-23'::Date - toIntervalDay(74) AND date <= '2023-06-23'::Date - toIntervalDay(24) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'jinja2' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'jinja2' AND date >= '2023-06-23'::Date - toIntervalDay(60) AND date <= '2023-06-23'::Date - toIntervalDay(14) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'cffi' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'cffi' AND date >= '2023-06-23'::Date - toIntervalDay(66) AND date <= '2023-06-23'::Date - toIntervalDay(35) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyjwt' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyjwt' AND date >= '2023-06-23'::Date - toIntervalDay(48) AND date <= '2023-06-23'::Date - toIntervalDay(28) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pycparser' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pycparser' AND date >= '2023-06-23'::Date - toIntervalDay(62) AND date <= '2023-06-23'::Date - toIntervalDay(48) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'aiobotocore' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'aiobotocore' AND date >= '2023-06-23'::Date - toIntervalDay(64) AND date <= '2023-06-23'::Date - toIntervalDay(13) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 's3fs' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 's3fs' AND date >= '2023-06-23'::Date - toIntervalDay(76) AND date <= '2023-06-23'::Date - toIntervalDay(41) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'fsspec' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'fsspec' AND date >= '2023-06-23'::Date - toIntervalDay(31) AND date <= '2023-06-23'::Date - toIntervalDay(15) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'grpcio-status' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'grpcio-status' AND date >= '2023-06-23'::Date - toIntervalDay(84) AND date <= '2023-06-23'::Date - toIntervalDay(66) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'googleapis-common-protos' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'googleapis-common-protos' AND date >= '2023-06-23'::Date - toIntervalDay(20) AND date <= '2023-06-23'::Date - toIntervalDay(12) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'docutils' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'docutils' AND date >= '2023-06-23'::Date - toIntervalDay(59) AND date <= '2023-06-23'::Date - toIntervalDay(13) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-auth' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-auth' AND date >= '2023-06-23'::Date - toIntervalDay(45) AND date <= '2023-06-23'::Date - toIntervalDay(27) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'oauthlib' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'oauthlib' AND date >= '2023-06-23'::Date - toIntervalDay(63) AND date <= '2023-06-23'::Date - toIntervalDay(37) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'tomli' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'tomli' AND date >= '2023-06-23'::Date - toIntervalDay(41) AND date <= '2023-06-23'::Date - toIntervalDay(2) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'wrapt' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'wrapt' AND date >= '2023-06-23'::Date - toIntervalDay(32) AND date <= '2023-06-23'::Date - toIntervalDay(6) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'cachetools' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'cachetools' AND date >= '2023-06-23'::Date - toIntervalDay(87) AND date <= '2023-06-23'::Date - toIntervalDay(10) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyparsing' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyparsing' AND date >= '2023-06-23'::Date - toIntervalDay(82) AND date <= '2023-06-23'::Date - toIntervalDay(27) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'werkzeug' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'werkzeug' AND date >= '2023-06-23'::Date - toIntervalDay(71) AND date <= '2023-06-23'::Date - toIntervalDay(63) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'sqlalchemy' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'sqlalchemy' AND date >= '2023-06-23'::Date - toIntervalDay(77) AND date <= '2023-06-23'::Date - toIntervalDay(69) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'requests-oauthlib' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'requests-oauthlib' AND date >= '2023-06-23'::Date - toIntervalDay(41) AND date <= '2023-06-23'::Date - toIntervalDay(26) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'multidict' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'multidict' AND date >= '2023-06-23'::Date - toIntervalDay(59) AND date <= '2023-06-23'::Date - toIntervalDay(34) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'yarl' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'yarl' AND date >= '2023-06-23'::Date - toIntervalDay(88) AND date <= '2023-06-23'::Date - toIntervalDay(30) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyarrow' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyarrow' AND date >= '2023-06-23'::Date - toIntervalDay(30) AND date <= '2023-06-23'::Date - toIntervalDay(22) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'jsonschema' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'jsonschema' AND date >= '2023-06-23'::Date - toIntervalDay(14) AND date <= '2023-06-23'::Date - toIntervalDay(2) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'platformdirs' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'platformdirs' AND date >= '2023-06-23'::Date - toIntervalDay(68) AND date <= '2023-06-23'::Date - toIntervalDay(4) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'async-timeout' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'async-timeout' AND date >= '2023-06-23'::Date - toIntervalDay(87) AND date <= '2023-06-23'::Date - toIntervalDay(39) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'aiohttp' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'aiohttp' AND date >= '2023-06-23'::Date - toIntervalDay(69) AND date <= '2023-06-23'::Date - toIntervalDay(59) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'isodate' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'isodate' AND date >= '2023-06-23'::Date - toIntervalDay(2) AND date <= '2023-06-23'::Date - toIntervalDay(1) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'psutil' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'psutil' AND date >= '2023-06-23'::Date - toIntervalDay(89) AND date <= '2023-06-23'::Date - toIntervalDay(73) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pydantic' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pydantic' AND date >= '2023-06-23'::Date - toIntervalDay(77) AND date <= '2023-06-23'::Date - toIntervalDay(19) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'decorator' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'decorator' AND date >= '2023-06-23'::Date - toIntervalDay(7) AND date <= '2023-06-23'::Date - toIntervalDay(6) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyasn1-modules' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyasn1-modules' AND date >= '2023-06-23'::Date - toIntervalDay(30) AND date <= '2023-06-23'::Date - toIntervalDay(28) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'soupsieve' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'soupsieve' AND date >= '2023-06-23'::Date - toIntervalDay(16) AND date <= '2023-06-23'::Date - toIntervalDay(8) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'flask' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'flask' AND date >= '2023-06-23'::Date - toIntervalDay(1) AND date <= '2023-06-23'::Date - toIntervalDay(0) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pluggy' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pluggy' AND date >= '2023-06-23'::Date - toIntervalDay(45) AND date <= '2023-06-23'::Date - toIntervalDay(28) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pytest' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pytest' AND date >= '2023-06-23'::Date - toIntervalDay(52) AND date <= '2023-06-23'::Date - toIntervalDay(10) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'beautifulsoup4' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'beautifulsoup4' AND date >= '2023-06-23'::Date - toIntervalDay(40) AND date <= '2023-06-23'::Date - toIntervalDay(19) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'lxml' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'lxml' AND date >= '2023-06-23'::Date - toIntervalDay(6) AND date <= '2023-06-23'::Date - toIntervalDay(2) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'filelock' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'filelock' AND date >= '2023-06-23'::Date - toIntervalDay(26) AND date <= '2023-06-23'::Date - toIntervalDay(19) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'grpcio' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'grpcio' AND date >= '2023-06-23'::Date - toIntervalDay(86) AND date <= '2023-06-23'::Date - toIntervalDay(36) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'greenlet' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'greenlet' AND date >= '2023-06-23'::Date - toIntervalDay(40) AND date <= '2023-06-23'::Date - toIntervalDay(14) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'frozenlist' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'frozenlist' AND date >= '2023-06-23'::Date - toIntervalDay(16) AND date <= '2023-06-23'::Date - toIntervalDay(4) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'coverage' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'coverage' AND date >= '2023-06-23'::Date - toIntervalDay(16) AND date <= '2023-06-23'::Date - toIntervalDay(14) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'aiosignal' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'aiosignal' AND date >= '2023-06-23'::Date - toIntervalDay(48) AND date <= '2023-06-23'::Date - toIntervalDay(5) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'azure-core' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'azure-core' AND date >= '2023-06-23'::Date - toIntervalDay(27) AND date <= '2023-06-23'::Date - toIntervalDay(2) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'scipy' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'scipy' AND date >= '2023-06-23'::Date - toIntervalDay(63) AND date <= '2023-06-23'::Date - toIntervalDay(22) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pillow' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pillow' AND date >= '2023-06-23'::Date - toIntervalDay(66) AND date <= '2023-06-23'::Date - toIntervalDay(45) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'tqdm' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'tqdm' AND date >= '2023-06-23'::Date - toIntervalDay(14) AND date <= '2023-06-23'::Date - toIntervalDay(4) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyrsistent' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyrsistent' AND date >= '2023-06-23'::Date - toIntervalDay(78) AND date <= '2023-06-23'::Date - toIntervalDay(37) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'virtualenv' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'virtualenv' AND date >= '2023-06-23'::Date - toIntervalDay(29) AND date <= '2023-06-23'::Date - toIntervalDay(4) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'et-xmlfile' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'et-xmlfile' AND date >= '2023-06-23'::Date - toIntervalDay(60) AND date <= '2023-06-23'::Date - toIntervalDay(8) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'openpyxl' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'openpyxl' AND date >= '2023-06-23'::Date - toIntervalDay(5) AND date <= '2023-06-23'::Date - toIntervalDay(0) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'importlib-resources' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'importlib-resources' AND date >= '2023-06-23'::Date - toIntervalDay(38) AND date <= '2023-06-23'::Date - toIntervalDay(8) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyopenssl' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pyopenssl' AND date >= '2023-06-23'::Date - toIntervalDay(77) AND date <= '2023-06-23'::Date - toIntervalDay(30) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'iniconfig' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'iniconfig' AND date >= '2023-06-23'::Date - toIntervalDay(82) AND date <= '2023-06-23'::Date - toIntervalDay(25) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pygments' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pygments' AND date >= '2023-06-23'::Date - toIntervalDay(20) AND date <= '2023-06-23'::Date - toIntervalDay(8) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'chardet' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'chardet' AND date >= '2023-06-23'::Date - toIntervalDay(27) AND date <= '2023-06-23'::Date - toIntervalDay(13) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'asn1crypto' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'asn1crypto' AND date >= '2023-06-23'::Date - toIntervalDay(67) AND date <= '2023-06-23'::Date - toIntervalDay(44) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'itsdangerous' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'itsdangerous' AND date >= '2023-06-23'::Date - toIntervalDay(85) AND date <= '2023-06-23'::Date - toIntervalDay(14) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'exceptiongroup' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'exceptiongroup' AND date >= '2023-06-23'::Date - toIntervalDay(66) AND date <= '2023-06-23'::Date - toIntervalDay(62) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'websocket-client' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'websocket-client' AND date >= '2023-06-23'::Date - toIntervalDay(80) AND date <= '2023-06-23'::Date - toIntervalDay(72) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'tabulate' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'tabulate' AND date >= '2023-06-23'::Date - toIntervalDay(12) AND date <= '2023-06-23'::Date - toIntervalDay(11) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-api-python-client' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-api-python-client' AND date >= '2023-06-23'::Date - toIntervalDay(70) AND date <= '2023-06-23'::Date - toIntervalDay(69) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'requests-toolbelt' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'requests-toolbelt' AND date >= '2023-06-23'::Date - toIntervalDay(10) AND date <= '2023-06-23'::Date - toIntervalDay(5) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-cloud-core' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-cloud-core' AND date >= '2023-06-23'::Date - toIntervalDay(2) AND date <= '2023-06-23'::Date - toIntervalDay(0) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'mypy-extensions' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'mypy-extensions' AND date >= '2023-06-23'::Date - toIntervalDay(69) AND date <= '2023-06-23'::Date - toIntervalDay(15) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pynacl' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'pynacl' AND date >= '2023-06-23'::Date - toIntervalDay(76) AND date <= '2023-06-23'::Date - toIntervalDay(27) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-cloud-storage' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'google-cloud-storage' AND date >= '2023-06-23'::Date - toIntervalDay(42) AND date <= '2023-06-23'::Date - toIntervalDay(40) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'psycopg2-binary' AND (date >= '2023-06-23'::Date - toIntervalDay(90)) GROUP BY file.type ORDER BY c DESC LIMIT 10
SELECT file.type, count() as c FROM pypi WHERE project = 'psycopg2-binary' AND date >= '2023-06-23'::Date - toIntervalDay(70) AND date <= '2023-06-23'::Date - toIntervalDay(26) GROUP BY file.type ORDER BY c DESC LIMIT 10
