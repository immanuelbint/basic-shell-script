#!/bin/bash

## Script Yarn Tools

## Define user function
read -r -p "Ketikkan tool yarn yang ingin digunakan, example yarn list, yarn kill, yarn logs=> " respon

## if else function
if [[ "$respon" =~ ^(yarnkill|yarn kill|Yarnkill|Yarn kill|YarnKill|Yarn Kill)$ ]]
then
    read -r -p "Ketikkan applicationID => " response
    yarn application -kill $response
elif [[ "$respon" =~ ^(yarnlogs|yarn logs|Yarnlogs|Yarn logs|YarnLogs|Yarn Logs|yarnlog|yarn log|Yarn log|Yarn Log)$ ]]
then
    read -r -p "Ketikkan applicationID => " response
    yarn logs -applicationId $response
else [[ "$respon" =~ ^(yarnlist|yarn list|Yarnlist|Yarn list|YarnList|Yarn List)$ ]]
    yarn app -list
fi
