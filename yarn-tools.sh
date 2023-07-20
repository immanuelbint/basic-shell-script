#!/bin/bash

### DESCRIPTION ########################
# Running YARN few basic tools
########################################

menu="
Ketikkan nomer/angka pada tools YARN yang ingin digunakan :
1. YARN kill applicationID
2. Get logs in running job YARN
3. List all running job in YARN
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
  read -r -p "Ketikkan applicationID => " response
  yarn application -kill $response || echo "error applicationID not found"
elif [ "$EXE" == 2 ]; then
  read -r -p "Ketikkan applicationID => " response
  yarn logs -applicationId $response || echo "error applicationID not found"
elif [ "$EXE" == 3 ]; then
  yarn app -list
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
