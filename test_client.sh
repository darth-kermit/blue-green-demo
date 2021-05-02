#!/bin/bash
wait_period=0

while true
do
    echo "Time Now: `date +%H:%M:%S`"
    echo "Curling Orcish Translater"
    echo "Time Now: `date +%H:%M:%S`" >> test_client_results/deployment-results.txt
    curl 3.14.254.63:8080/version >> test_client_results/deployment-results.txt
    echo "" >> test_client_results/deployment-results.txt 
    echo "------------------------------------------------" >> test_client_results/deployment-results.txt 
    wait_period=$(($wait_period+1))
    if [ $wait_period -gt 300 ];then
       echo "The script successfully ran for 5 minutes, exiting now.."
       break
    fi
done