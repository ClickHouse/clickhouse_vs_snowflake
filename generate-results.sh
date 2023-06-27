#!/bin/bash -e

# This script will generate the benchmark results into the HTML page.
# Note: editing HTML with sed may look strange, but at least we avoid using node.js and npm, and that's good.

folder=$1
if [ -z "$folder" ] ; then
  echo "folder must be specified"
  exit 1
fi

(
    sed '/^const data = \[$/q' index.html.template

    FIRST=1
    ls -1 $folder/results/*.json | while read file
    do
        [[ $file =~ ^(hardware|versions)/ ]] && continue;

        [ "${FIRST}" = "0" ] && echo -n ','
        jq --compact-output ". += {\"source\": \"${file}\"}" "${file}"
        FIRST=0
    done
    set -o noglob
    echo ']; // end of data'
    echo 'const queries = ['
    FIRST=1
    cat $folder/clickhouse_queries.sql | while read query; do
        [ "${FIRST}" = "0" ] && echo -n ','
        echo $query | jq  --raw-input .
        FIRST=0
    done
    echo ']; // end of queries'
    sed '1,/^\]; \/\/ end of queries$/d' index.html.template
    set +o noglob
) > $folder/index.html
