#!/bin/bash

## shell script stop delete container

## define container name
read -r -p "enter container name/id you'd like to stop example container1 container2 => " response

## running loop stoping container
for i in $response; do docker stop $i; done &> /dev/null && echo "stop container: ok" || echo "stop container: failed"

## optional deleting container
read -r -p "do you want to delete the container you've stopped before? [y/n] " responuser

## conditional response
if [[ "$responuser" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    docker rm $response &> /dev/null && echo "remove container: ok" || echo "remove container: failed"
else
    exit 0
fi
