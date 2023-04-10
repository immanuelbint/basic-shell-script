#!/bin/bash
# Script auto delete file lock di Solr

# List write.lock file solr
hdfs dfs -ls /apps/solr/data/*/*/data/*/*write.lock

read -r -p "Are you sure want to delete all file write.lock? [y/n] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    hdfs dfs -rm -f -skipTrash /apps/solr/data/*/*/data/*/write.lock
else
    exit 0
fi
