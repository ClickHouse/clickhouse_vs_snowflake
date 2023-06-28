import os
import random

import clickhouse_connect


def downloads_per_day(projects, max_datetime, max_date):
    with open('downloads_per_day/clickhouse_queries.sql', 'w') as click_queries_file, \
            open('downloads_per_day/snowflake_queries.sql', 'w') as snow_queries_file:
        for project in projects:
            lower_n_days = 90
            click_queries_file.write(
                f"SELECT toStartOfDay(date), count() as count FROM pypi WHERE project = '{project}' "
                f"AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) GROUP BY date "
                f"ORDER BY date ASC;\n")
            snow_queries_file.write(
                f"SELECT DATE_TRUNC('DAY',timestamp) AS day, count(*) AS count FROM pypi WHERE (project = '{project}') "
                f"AND (timestamp >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) GROUP BY day ORDER BY day ASC;\n")
            lower_n_days = random.randint(1, 90)
            upper_n_days = random.randint(0, lower_n_days - 1)
            difference_secs = (lower_n_days - upper_n_days) * 86400
            # 100 buckets
            interval = int(difference_secs / 100)
            click_queries_file.write(f"SELECT toStartOfInterval(timestamp, INTERVAL {interval} second) as period, "
                                     f"count() as count FROM pypi WHERE project = '{project}' AND "
                                     f"date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) AND "
                                     f"date  <= '{max_date}'::Date - toIntervalDay({upper_n_days}) AND "
                                     f"timestamp >= '{max_datetime}'::DateTime - toIntervalDay({lower_n_days}) "
                                     f"AND timestamp  <= '{max_datetime}'::DateTime - toIntervalDay({upper_n_days}) "
                                     f"GROUP BY period ORDER BY period ASC;\n")

            snow_queries_file.write(
                f"SELECT TIME_SLICE(timestamp, {interval}, 'SECOND', 'START') AS period, count(*) FROM pypi " \
                f"WHERE (project = '{project}') AND (timestamp >= DATEADD(days, -{lower_n_days}, '{max_datetime}'::DateTime)) " \
                f"AND timestamp <= DATEADD(days, -{upper_n_days}, '{max_datetime}'::DateTime) GROUP BY period ORDER BY period ASC;\n")


def downloads_per_day_by_python_version(projects, max_datetime, max_date):
    with open('downloads_per_day_by_python_version/clickhouse_queries.sql', 'w') as click_queries_file, \
            open('downloads_per_day_by_python_version/snowflake_queries.sql', 'w') as snow_queries_file:
        for project in projects:
            lower_n_days = 90
            upper_n_days = 0
            click_queries_file.write(f"SELECT date as day, splitByChar('.', python)[1] || '.' || "
                                     f"splitByChar('.', python)[2] as major, count() AS count FROM pypi "
                                     f"WHERE python != '' AND (project = '{project}') AND date >= '{max_date}'::Date - "
                                     f"toIntervalDay({lower_n_days}) GROUP BY day, major ORDER BY day ASC, major ASC\n")
            snow_queries_file.write(
                f"SELECT DATE_TRUNC('DAY',timestamp) AS day, SPLIT(python, '.')[0] || '.' || SPLIT(python, '.')[1] as major, "
                f"count(*) AS count FROM pypi WHERE python != '' AND (project = '{project}') AND "
                f"(timestamp >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) GROUP BY day, major ORDER BY day ASC, major ASC;\n")
            lower_n_days = random.randint(1, 90)
            upper_n_days = random.randint(0, lower_n_days - 1)
            difference_secs = (lower_n_days - upper_n_days) * 86400
            # 100 buckets
            interval = int(difference_secs / 100)
            click_queries_file.write(f"SELECT toStartOfInterval(timestamp, INTERVAL {interval} second) as period, "
                                     f"count() as count, splitByChar('.', python)[1] || '.' || "
                                     f"splitByChar('.', python)[2] as major FROM pypi WHERE python != '' AND "
                                     f"project = '{project}' AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) "
                                     f"AND date  <= '{max_date}'::Date - toIntervalDay({upper_n_days}) AND "
                                     f"timestamp >= '{max_datetime}'::DateTime - toIntervalDay({lower_n_days}) "
                                     f"AND timestamp  <= '{max_datetime}'::DateTime - toIntervalDay({upper_n_days}) "
                                     f"GROUP BY period, major ORDER BY period ASC, major ASC;\n")

            snow_queries_file.write(
                f"SELECT TIME_SLICE(timestamp, {interval}, 'SECOND', 'START') AS period, SPLIT(python, '.')[0] || '.' || "
                f"SPLIT(python, '.')[1] as major, count(*) as c FROM pypi WHERE python != ''  AND (project = '{project}') AND "
                f"(timestamp >= DATEADD(days, -{lower_n_days}, '{max_datetime}'::DateTime)) AND timestamp <= "
                f"DATEADD(days, -{upper_n_days}, '{max_datetime}'::DateTime) GROUP BY period, major ORDER BY period, "
                f"major ASC;\n")


def downloads_per_day_by_system(projects, max_datetime, max_date):
    with open('downloads_per_day_by_system/clickhouse_queries.sql', 'w') as click_queries_file, \
            open('downloads_per_day_by_system/snowflake_queries.sql', 'w') as snow_queries_file:
        for project in projects:
            lower_n_days = 90
            click_queries_file.write(f"SELECT date as day, system.name as system, count() AS count FROM pypi "
                                     f"WHERE (project = '{project}') AND (date >= '{max_date}'::Date - "
                                     f"toIntervalDay({lower_n_days})) AND system IN ( SELECT system.name as system FROM pypi "
                                     f"WHERE system != '' AND project = '{project}' GROUP BY system ORDER BY count() DESC LIMIT 10) "
                                     f"GROUP BY day, system ORDER BY day ASC, count DESC;\n")
            snow_queries_file.write(
                f"SELECT DATE_TRUNC('DAY',timestamp) AS day, system['name'] as system_name, count(*) AS count FROM pypi WHERE "
                f"(project = '{project}') AND (timestamp >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) AND system_name IN ("
                f"SELECT system['name'] as system_name FROM pypi WHERE system_name != '' AND project = '{project}' GROUP BY system_name ORDER BY count(*) DESC "
                f"LIMIT 10) GROUP BY day, system_name ORDER BY day ASC, count DESC;\n")
            lower_n_days = random.randint(1, 90)
            upper_n_days = random.randint(0, lower_n_days - 1)
            difference_secs = (lower_n_days - upper_n_days) * 86400
            # 100 buckets
            interval = int(difference_secs / 100)
            click_queries_file.write(f"SELECT toStartOfInterval(timestamp, INTERVAL {interval} second) as period, "
                                     f"count() as count, system.name as system FROM pypi WHERE "
                                     f"project = '{project}' AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) "
                                     f"AND date  <= '{max_date}'::Date - toIntervalDay({upper_n_days}) AND "
                                     f"timestamp >= '{max_datetime}'::DateTime - toIntervalDay({lower_n_days}) "
                                     f"AND timestamp  <= '{max_datetime}'::DateTime - toIntervalDay({upper_n_days}) AND "
                                     f"system IN ( SELECT system.name as system FROM pypi "
                                     f"WHERE system != '' AND project = '{project}' GROUP BY system ORDER BY count() DESC LIMIT 10)"
                                     f"GROUP BY period, system ORDER BY period ASC, count DESC;\n")
            snow_queries_file.write(
                f"SELECT TIME_SLICE(timestamp, {interval}, 'SECOND', 'START') AS period, system['name'] as system_name, "
                f"count(*) as c FROM pypi WHERE (project = '{project}') AND (timestamp >= DATEADD(days, -{lower_n_days}, "
                f"'{max_datetime}'::DateTime)) AND timestamp <= DATEADD(days, -{upper_n_days}, '{max_datetime}'::DateTime) "
                f"AND system_name IN ( SELECT system['name'] as system_name FROM pypi WHERE system_name != '' AND "
                f"(project = '{project}') GROUP BY system_name ORDER BY "
                f"count(*) DESC LIMIT 10) GROUP BY period, system_name ORDER BY period, c DESC;\n")


def top_file_type_per_project(projects, max_date):
    with open('top_file_type_per_project/clickhouse_queries.sql', 'w') as click_queries_file, \
            open('top_file_type_per_project/snowflake_queries.sql', 'w') as snow_queries_file:
        for project in projects:
            lower_n_days = 90
            upper_n_days = 0
            click_queries_file.write(f"SELECT file.type, count() as c FROM pypi WHERE project = '{project}' "
                                     f"AND (date >= '{max_date}'::Date - toIntervalDay({lower_n_days})) "
                                     f"GROUP BY file.type ORDER BY c DESC LIMIT 10;\n")
            snow_queries_file.write(f"SELECT file['type'], count(*) as c FROM pypi WHERE project = '{project}' "
                                    f"AND (timestamp >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) "
                                    f"GROUP BY file['type'] ORDER BY c DESC LIMIT 10;\n")
            lower_n_days = random.randint(1, 90)
            upper_n_days = random.randint(0, lower_n_days - 1)
            click_queries_file.write(f"SELECT file.type, count() as c FROM pypi WHERE project = '{project}' "
                                     f"AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) "
                                     f"AND date <= '{max_date}'::Date - toIntervalDay({upper_n_days}) "
                                     f"GROUP BY file.type ORDER BY c DESC LIMIT 10;\n")
            snow_queries_file.write(f"SELECT file['type'], count(*) as c FROM pypi WHERE project = '{project}' "
                                    f"AND (timestamp::Date >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) "
                                    f"AND timestamp::Date <= DATEADD(days, -{upper_n_days}, '{max_date}'::Date) "
                                    f"GROUP BY file['type'] ORDER BY c DESC LIMIT 10;\n")


def top_projects_by_distro(distros, max_datetime, max_date):
    with open('top_projects_by_distro/clickhouse_queries.sql', 'w') as click_queries_file, \
            open('top_projects_by_distro/snowflake_queries.sql', 'w') as snow_queries_file:
        for distro in distros:
            lower_n_days = 90
            click_queries_file.write(f"SELECT project, count() as c FROM pypi WHERE distro.name = '{distro}' "
                                     f"AND (date >= '{max_date}'::Date - toIntervalDay({lower_n_days})) "
                                     f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")
            snow_queries_file.write(f"SELECT project, count(*) as c FROM pypi WHERE distro['name'] = '{distro}' "
                                    f"AND (timestamp >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) "
                                    f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")
            lower_n_days = random.randint(1, 90)
            upper_n_days = random.randint(0, lower_n_days - 1)
            click_queries_file.write(f"SELECT project, count() as c FROM pypi WHERE distro.name = '{distro}' "
                                     f"AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) "
                                     f"AND date <= '{max_date}'::Date - toIntervalDay({upper_n_days}) AND "
                                     f"timestamp >= '{max_datetime}'::DateTime - toIntervalDay({lower_n_days}) "
                                     f"AND timestamp  <= '{max_datetime}'::DateTime - toIntervalDay({upper_n_days}) "
                                     f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")
            snow_queries_file.write(f"SELECT project, count(*) as c FROM pypi WHERE distro['name'] = '{distro}' "
                                    f"AND (timestamp >= DATEADD(days, -{lower_n_days}, '{max_datetime}'::DateTime)) "
                                    f"AND timestamp <= DATEADD(days, -{upper_n_days}, '{max_datetime}'::DateTime) "
                                    f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")


def top_sub_projects(base_projects, max_datetime, max_date):
    with open('top_sub_projects/clickhouse_queries.sql', 'w') as click_queries_file, \
            open('top_sub_projects/snowflake_queries.sql', 'w') as snow_queries_file:
        for base_project in base_projects:
            lower_n_days = 90
            click_queries_file.write(f"select project, count() c FROM pypi WHERE project LIKE '%{base_project}%' "
                                     f"AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) "
                                     f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")
            snow_queries_file.write(f"select project, count(*) c FROM pypi WHERE project LIKE '%{base_project}%' AND "
                                    f"(timestamp >= DATEADD(days, -{lower_n_days}, '{max_date}'::Date)) "
                                    f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")
            lower_n_days = random.randint(1, 90)
            upper_n_days = random.randint(0, lower_n_days - 1)
            difference_secs = (lower_n_days - upper_n_days) * 86400
            click_queries_file.write(f"select project, count() c FROM pypi WHERE project LIKE '%{base_project}%' "
                                     f"AND date >= '{max_date}'::Date - toIntervalDay({lower_n_days}) AND "
                                     f"date  <= '{max_date}'::Date - toIntervalDay({upper_n_days}) AND "
                                     f"timestamp >= '{max_datetime}'::DateTime - toIntervalDay({lower_n_days}) "
                                     f"AND timestamp  <= '{max_datetime}'::DateTime - toIntervalDay({upper_n_days}) "
                                     f"GROUP BY project ORDER BY c DESC LIMIT 10;\n")
            snow_queries_file.write(f"select project, count(*) c FROM pypi WHERE project LIKE '%{base_project}%'AND "
                                    f"(timestamp >= DATEADD(days, -{lower_n_days}, '{max_datetime}'::DateTime)) "
                                    f"AND timestamp <= DATEADD(days, -{upper_n_days},  '{max_datetime}'::DateTime) "
                                    f"GROUP BY project  ORDER BY c DESC LIMIT 10;\n")


client = clickhouse_connect.get_client(host=os.getenv('CLICKHOUSE_HOST', 'localhost'),
                                       user=os.getenv('CLICKHOUSE_USER', 'default'),
                                       password=os.getenv('CLICKHOUSE_PASSWORD', ''),
                                       port=int(os.getenv('CLICKHOUSE_PORT', 8443)),
                                       connect_timeout=15,
                                       database='default')

num_queries = 100
result = client.query(f'SELECT project FROM pypi GROUP BY project ORDER BY count() DESC LIMIT {num_queries}')
projects = [project[0] for project in result.result_rows]
result = client.query(f'SELECT max(timestamp) FROM pypi')
max_datetime = str(result.result_rows[0][0])
max_date = max_datetime[:10]

# downloads per day
print('generating downloads per day')
downloads_per_day(projects, max_datetime, max_date)
# downloads per day by python version
print('generating downloads per day by python version')
# downloads_per_day_by_python_version(projects, max_datetime, max_date)
print('generating downloads per day by system')
# downloads per day by system
downloads_per_day_by_system(projects, max_datetime, max_date)
# top file type per project
print('generating top file type per project')
top_file_type_per_project(projects, max_date)
print('generating top projects by distro')
result = client.query(f"SELECT distro.name FROM pypi WHERE distro.name != '' GROUP BY distro.name "
                       f"ORDER BY count() DESC LIMIT 20")
distros = [distro[0] for distro in result.result_rows]
# top projects by distro
top_projects_by_distro(distros, max_datetime, max_date)
# top sub projects
print('generating top sub projects')
result = client.query(
     f"SELECT splitByChar('-', project)[1] as base from pypi GROUP BY base ORDER BY count() DESC LIMIT 20")
base_projects = [project[0] for project in result.result_rows]
base_projects = base_projects + ['clickhouse', 'snowflake', 'mysql', 'elasticsearch', 'postgres']
top_sub_projects(base_projects, max_datetime, max_date)
