#!/bin/bash
# Script Create user directory HDFS

# Defining user
read -r -p "enter user to be added example user1 user2 => " response

# running loop command
for i in $response; do hdfs dfs -mkdir -p /user/"$i"; done &> /dev/null && echo "create dir : ok" || echo "create dir hdfs : failed"
for i in $response; do hdfs dfs -chown "$i":hdfs /user/"$i"; done &> /dev/null && echo "chown : ok" || echo "chown userdir hdfs : failed"
