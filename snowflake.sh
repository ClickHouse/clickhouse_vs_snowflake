#!/bin/bash

set -o noglob
TRIES=3
QUERY_NUM=1

folder=$1
if [ -z "$folder" ] ; then
  echo "folder must be specified"
  exit 1
fi

spec=$2
if [ -z "$spec" ] ; then
  echo "spec must be specified"
  exit 1
fi

config=$3
if [ -z "config" ] ; then
  echo "config must be specified"
  exit 1
fi

now=$(date +'%Y-%m-%d')
now_epoch=$(date +%s%N)
data_size=$(snowsql --schemaname INFORMATION_SCHEMA --dbname "${SNOWFLAKE_DB:=PYPI}" --warehouse "${SNOWFLAKE_WAREHOUSE:=2XLARGE}" --rolename "${SNOWFLAKE_ROLE:=ACCOUNTADMIN}" --query "SELECT ACTIVE_BYTES FROM TABLE_STORAGE_METRICS WHERE TABLE_NAME = 'PYPI' AND ACTIVE_BYTES > 0;" -o friendly=False  -o header=False -o output_format=plain -o timing=False)
echo "{\"system\":\"Snowflake\",\"date\":\"${now}\",\"machine\":\"${spec}\",\"config\":\"${config}\",\"comment\":\"\",\"tags\":[\"Cloud\"],\"data_size\":${data_size},\"result\":[" > $folder/snowflake_temp_${now_epoch}.json

cat $folder/sample.sql | while read query; do
    echo -n "[" >> $folder/snowflake_temp_${now_epoch}.json
    for i in $(seq 1 $TRIES); do
        RES=$(echo $query | snowsql --schemaname ${SNOWFLAKE_SCHEMA:=PYPI} --dbname ${SNOWFLAKE_DB:=PYPI} --warehouse ${SNOWFLAKE_WAREHOUSE:=2XLARGE} -o echo=False -o timing=True -o friendly=False | grep -E -o 'Time Elapsed: [0-9.]+s' | grep -E -o '[0-9.]+' 2>&1)
        if [ "$?" == "0" ] && [ "${#RES}" -lt "10" ]; then
            echo "${QUERY_NUM}, ${i} - OK"
            echo -n "${RES}" >> $folder/snowflake_temp_${now_epoch}.json
        else
            echo "${QUERY_NUM}, ${i} - FAIL - ${RES}"
            echo -n "null" >> $folder/snowflake_temp_${now_epoch}.json
        fi
        [[ "$i" != $TRIES ]] && echo -n "," >> $folder/snowflake_temp_${now_epoch}.json
    done
    echo "]," >> $folder/snowflake_temp_${now_epoch}.json

    QUERY_NUM=$((QUERY_NUM + 1))
done

sed '$ s/.$//' $folder/snowflake_temp_${now_epoch}.json > $folder/snowflake_results_${now_epoch}.json
echo ']}' >> $folder/snowflake_results_${now_epoch}.json
mkdir -p $folder/results
cat $folder/snowflake_results_${now_epoch}.json | jq > $folder/results/snowflake_${spec}.json
rm $folder/snowflake_results_${now_epoch}.json
rm $folder/snowflake_temp_${now_epoch}.json
set +o noglob