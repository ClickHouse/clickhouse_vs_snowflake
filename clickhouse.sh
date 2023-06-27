#!/bin/bash

set -o noglob
TRIES=3
QUERY_NUM=1

folder=$1
if [ -z "$folder" ] ; then
  echo "folder must be specified"
  exit 1
fi

cloud=$2
on_cluster=""
if [ "$cloud" = "true" ] ; then
    on_cluster=" ON CLUSTER 'default'"
    echo "running against cloud cluster"
fi

data_size=$(/opt/clickhouse-install/clickhouse client --host "${CLICKHOUSE_HOST:=localhost}" --user "${CLICKHOUSE_USER:=default}" --password "${CLICKHOUSE_PASSWORD:=}" --secure --query="SELECT sum(total_bytes) FROM system.tables WHERE table = 'pypi'")
now=$(date +'%Y-%m-%d')
echo "{\"system\":\"ClickHouse\",\"date\":\"${now}\",\"machine\":\"720 GB\",\"cluster_size\":3,\"comment\":\"\",\"tags\":[\"Cloud\"],\"data_size\":${data_size},\"result\":[" > $folder/clickhouse_temp.json

echo "dropping file system cache"
/opt/clickhouse-install/clickhouse client --host "${CLICKHOUSE_HOST:=localhost}" --user "${CLICKHOUSE_USER:=default}" --password "${CLICKHOUSE_PASSWORD:=}" --secure --format=Null --query="SYSTEM DROP FILESYSTEM CACHE${on_cluster}"

cat $folder/sample.sql | while read query; do
    echo -n "[" >> $folder/clickhouse_temp.json
    for i in $(seq 1 $TRIES); do
        RES=$(/opt/clickhouse-install/clickhouse client --host "${CLICKHOUSE_HOST:=localhost}" --user "${CLICKHOUSE_USER:=default}" --password "${CLICKHOUSE_PASSWORD:=}" --secure --time --format=Null --query="${query} ${SETTINGS}" 2>&1)
        if [ "$?" == "0" ] && [ "${#RES}" -lt "10" ]; then
            echo "${QUERY_NUM}, ${i} - OK"
            echo -n "${RES}" >> $folder/clickhouse_temp.json
        else
            echo "${QUERY_NUM}, ${i} - FAIL - ${RES}"
            echo -n "null" >> $folder/clickhouse_temp.json
        fi
        [[ "$i" != $TRIES ]] && echo -n "," >> $folder/clickhouse_temp.json
    done
    echo "]," >> $folder/clickhouse_temp.json

    QUERY_NUM=$((QUERY_NUM + 1))
done

sed '$ s/.$//' $folder/clickhouse_temp.json > $folder/clickhouse_results.json
echo ']}' >> $folder/clickhouse_results.json
mkdir -p $folder/results
cat $folder/clickhouse_results.json | jq > $folder/results/clickhouse.json
rm $folder/clickhouse_results.json
rm $folder/clickhouse_temp.json
set +o noglob
