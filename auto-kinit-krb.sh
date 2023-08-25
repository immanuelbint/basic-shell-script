#!/bin/bash

# basic script auto kinit keytab
read -r -p "ketikkan nama service yang ingin di kinit => " respon

if [[ "$respon" =~ ^(hdfs|Hdfs|HDFS)$ ]]
then
    KEYTAB_HDFS=/etc/security/keytabs/hdfs.headless.keytab
    PRINCIPAL_HDFS=$(klist -kt $KEYTAB_HDFS | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_HDFS $PRINCIPAL_HDFS
elif [[ "$respon" =~ ^(yarn|Yarn|YARN)$ ]]
then
    KEYTAB_YARN=/etc/security/keytabs/yarn.service.keytab
    PRINCIPAL_YARN=$(klist -kt $KEYTAB_YARN | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_YARN $PRINCIPAL_YARN
elif [[ "$respon" =~ ^(hbase|Hbase|HBASE)$ ]]
then
    KEYTAB_HBASE=/etc/security/keytabs/hbase.service.keytab
    PRINCIPAL_HBASE=$(klist -kt $KEYTAB_HBASE | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_HBASE $PRINCIPAL_HBASE
elif [[ "$respon" =~ ^(hive|Hive|HIVE)$ ]]
then
    KEYTAB_HIVE=/etc/security/keytabs/hive.service.keytab
    PRINCIPAL_HIVE=$(klist -kt $KEYTAB_HIVE | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_HIVE $PRINCIPAL_HIVE
elif [[ "$respon" =~ ^(storm|Storm|STORM)$ ]]
then
    KEYTAB_STORM=/etc/security/keytabs/storm.headless.keytab
    PRINCIPAL_STORM=$(klist -kt $KEYTAB_STORM | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_STORM $PRINCIPAL_STORM
elif [[ "$respon" =~ ^(kafka|Kafka|KAFKA)$ ]]
then
    KEYTAB_KAFKA=/etc/security/keytabs/kafka.service.keytab
    PRINCIPAL_KAFKA=$(klist -kt $KEYTAB_KAFKA | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_KAFKA $PRINCIPAL_KAFKA
elif [[ "$respon" =~ ^(solr|Solr|SOLR)$ ]]
then
    KEYTAB_SOLR=/etc/security/keytabs/solr.service.keytab
    PRINCIPAL_SOLR=$(klist -kt $KEYTAB_SOLR | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_SOLR $PRINCIPAL_SOLR
elif [[ "$respon" =~ ^(spark|Spark|SPARK)$ ]]
then
    KEYTAB_SPARK=/etc/security/keytabs/spark.service.keytab
    PRINCIPAL_SPARK=$(klist -kt $KEYTAB_SPARK | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_SPARK $PRINCIPAL_SPARK
else
    KEYTAB_CUSTOM=/etc/security/keytabs/$respon.keytab
    PRINCIPAL_CUSTOM=$(klist -kt $KEYTAB_CUSTOM | grep @ | cut -d' ' -f 7 | head -1)
    kinit -kt $KEYTAB_CUSTOM $PRINCIPAL_CUSTOM || echo "please enter valid name / keytab not found"
fi
