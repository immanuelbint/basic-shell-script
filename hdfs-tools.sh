#!/bin/bash

### DESCRIPTION ########################
# Running HDFS few basic tools
########################################

menu="
Ketikkan nomer/angka pada tools HDFS yang ingin digunakan :
1. Savenamespace namenode HDFS
2. Get report status HDFS
3. Check list corrupt HDFS
4. Fsck delete HDFS
===========================================================
i: Open stdin untuk execute command manual
s: Munculkan list menu ini kembali
c: Clear Screen
q: Stop script ini

=> "

printf "$menu"

loop(){
read -n 1 output

EXE=
if [ "$output" == 1 ]; then
   read -n 1 EXE
fi
EXE=${output}${EXE}
echo
if [ "$EXE" == 1 ]; then
   hdfs dfsadmin -safemode enter; hdfs dfsadmin -saveNamespace
   hdfs dfsadmin -safemode leave &> /dev/null && echo "save namespace: ok" || echo "save namespace: failed"
elif [ "$EXE" == 2 ]; then
   hdfs dfsadmin -report
elif [ "$EXE" == 3 ]; then
   hdfs fsck -list-corruptfileblocks
elif [ "$EXE" == 4 ]; then
   hdfs fsck / -delete
elif [ "$EXE" == i ]; then
   printf "shell> "
   read -e shell
   "$SHELL" -c "$shell"
elif [ "$EXE" == s ]; then
   printf "$menu"
elif [ "$EXE" == c ]; then
   clear
elif [ "$EXE" == q ]; then
   exit 0
fi
}
while [ 1 ]; do loop; done
