#!/bin/bash
# SHELL SCRIPT HK HADOOP SERVICE
## Crafted by immanuelbint
## Define Log path variables using default path, if your environment is different, change it below
declare -A SERVICE_LOG_PATH
SERVICE_LOG_PATH["ambariserver"]="/var/log/ambari-server/"
SERVICE_LOG_PATH["ambariagent"]="/var/log/ambari-agent/"
SERVICE_LOG_PATH["amc"]="/var/log/ambari-metrics-collector/"
SERVICE_LOG_PATH["hdfs"]="/var/log/hadoop/hdfs/"
SERVICE_LOG_PATH["yarn"]="/var/log/hadoop-yarn/yarn/"
SERVICE_LOG_PATH["mapred"]="/var/log/hadoop-mapreduce/mapred/"
SERVICE_LOG_PATH["zk"]="/var/log/zookeeper/"
SERVICE_LOG_PATH["hive"]="/var/log/hive/"

## Function to housekeeping logs
clean_log() {
    shopt -s nullglob
    for pattern in "${PATTERN[@]}"; do
      for file in $LOG_PATH/$pattern; do
        echo "Removing file $file" >> $CLEANER_LOG
        rm -f "$file"
      done
    done
}
## Function to loop hk all path logs
hk_log_path() {
    for folder in "${SERVICE_LOG_PATH[@]}"; do
      if [[ -d $folder ]]; then
        LOG_PATH=${folder}
        clean_log
      else
        echo "Directory $LOG_PATH not exist, skip ..."
    fi
done
}

## Main Program
echo "====== Script Started ======= : $(date +%Y/%m/%d_%H:%M)" >> $CLEANER_LOG
hk_log_path
