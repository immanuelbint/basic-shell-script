#!/bin/bash

## Shell script monitor disk space
## It will send an message to telegram
ID="" ## telegram chatID
API_KEY="" ## telegram Bot API KEY
ALERT="90" ## default send alert if disk threshold 90%

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r output;
do
  echo "$output"
  used=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo "$output" | awk '{ print $2 }' )
  pesan="Alert: on server $(hostname) $(date) Almost ran out disk space $used% on $partition"
  if [ $used -ge $ALERT ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
    curl -s --data "text=$pesan" --data "chat_id=$ID" 'https://api.telegram.org/bot'$API_KEY'/sendMessage' > /dev/null
  fi
done
