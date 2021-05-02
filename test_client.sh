#!/bin/bash
wait_period=0

while true
do
    echo "Time Now: `date +%H:%M:%S`"
    echo "Curling Orcish Translater"
    curl 3.14.254.63:8080/version
    echo "END"
    wait_period=$(($wait_period+1))
    if [ $wait_period -gt 300 ];then
       echo "The script successfully ran for 5 minutes, exiting now.."
       break
    fi
done