#!/bin/bash

## Shell script basic HDFS Tools

## Define user input
read -r -p "Ketikkan tool HDFS yang ingin digunakan, example savenamespace, report, listcorrupt, fsckdelete=> " respon

## if else function
if [[ "$respon" =~ ^(savenamespace|save namespace|savecheckpoint|save checkpoint|Savenamespace|Save Namespace|SaveNamespace)$ ]]
then
    hdfs dfsadmin -safemode enter; hdfs dfsadmin -saveNamespace; hdfs dfsadmin -safemode leave &> /dev/null && echo "save namespace: ok" || echo "save namespace: failed"
elif [[ "$respon" =~ ^(report|Report|hdfsreport|hdfs report|Hdfs report|Hdfsreport|HDFS report|HDFSreport|HDFS Report)$ ]]
then
    hdfs dfsadmin -report
elif [[ "$respon" =~ ^(listcorrupt|list corrupt|Listcorrupt|List corrupt|List Corrupt|listcorruptblock|list corrupt block)$ ]]
then
    hdfs fsck -list-corruptfileblocks
elif [[ "$respon" =~ ^(fsckdelete|fsck delete|Fsck delete|Fsck Delete|hdfs fsck delete|hdfsfsckdelete)$ ]]
then
    hdfs fsck / -delete
else
echo "Please enter valid command"; exit 0
fi
