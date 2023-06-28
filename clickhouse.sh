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
tag="Self-Managed"
on_cluster=""
if [ "$cloud" = "true" ] ; then
    on_cluster=" ON CLUSTER 'default'"
    tag="Cloud"
    echo "running against cloud cluster"
fi

spec=$3
if [ -z "$spec" ] ; then
  echo "spec must be specified"
  exit 1
fi

config=$4
if [ -z "$config" ] ; then
  echo "config must be specified"
  exit 1
fi

data_size=$(/opt/clickhouse-install/clickhouse client --host "${CLICKHOUSE_HOST:=localhost}" --user "${CLICKHOUSE_USER:=default}" --password "${CLICKHOUSE_PASSWORD:=}" --secure --query="SELECT sum(total_bytes) FROM system.tables WHERE table = 'pypi'")
now=$(date +'%Y-%m-%d')
now_epoch=$(date +%s%N)
echo "{\"system\":\"ClickHouse\",\"date\":\"${now}\",\"machine\":\"${spec}\",\"config\":\"${config}\",\"comment\":\"\",\"tags\":[\"${tag}\"],\"data_size\":${data_size},\"result\":[" > $folder/clickhouse_temp_${now_epoch}.json

echo "dropping file system cache"
/opt/clickhouse-install/clickhouse client --host "${CLICKHOUSE_HOST:=localhost}" --user "${CLICKHOUSE_USER:=default}" --password "${CLICKHOUSE_PASSWORD:=}" --secure --format=Null --query="SYSTEM DROP FILESYSTEM CACHE${on_cluster}"

cat $folder/${QUERY_FILE:=clickhouse_queries.sql} | while read query; do
    echo -n "[" >> $folder/clickhouse_temp_${now_epoch}.json
    for i in $(seq 1 $TRIES); do
        RES=$(/opt/clickhouse-install/clickhouse client --host "${CLICKHOUSE_HOST:=localhost}" --user "${CLICKHOUSE_USER:=default}" --password "${CLICKHOUSE_PASSWORD:=}" --secure --time --format=Null --query="${query} ${CLICKHOUSE_SETTINGS};" 2>&1)
        if [ "$?" == "0" ] && [ "${#RES}" -lt "10" ]; then
            echo "${QUERY_NUM}, ${i} - OK"
            echo -n "${RES}" >> $folder/clickhouse_temp_${now_epoch}.json
        else
            echo "${QUERY_NUM}, ${i} - FAIL - ${RES}"
            echo -n "null" >> $folder/clickhouse_temp_${now_epoch}.json
        fi
        [[ "$i" != $TRIES ]] && echo -n "," >> $folder/clickhouse_temp_${now_epoch}.json
    done
    echo "]," >> $folder/clickhouse_temp_${now_epoch}.json
    QUERY_NUM=$((QUERY_NUM + 1))
done


sed '$ s/.$//' $folder/clickhouse_temp_${now_epoch}.json > $folder/clickhouse_results_${now_epoch}.json
echo ']}' >> $folder/clickhouse_results_${now_epoch}.json
mkdir -p $folder/results
cat $folder/clickhouse_results_${now_epoch}.json | jq > $folder/results/clickhouse_${spec}_${config}.json
rm $folder/clickhouse_results_${now_epoch}.json
rm $folder/clickhouse_temp_${now_epoch}.json
set +o noglob
