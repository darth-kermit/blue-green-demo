#!/bin/bash
wait_period=0

while true
do
    echo "Time Now: `date +%H:%M:%S`"
    echo "Curling Orcish Translater"
    echo "Time Now: `date +%H:%M:%S`" >> test_client_results/deployment-results.txt
    curl http://test-endpoint-492633064.us-east-2.elb.amazonaws.com:8080/version >> test_client_results/deployment-results.txt
    echo "" >> test_client_results/deployment-results.txt 
    echo "------------------------------------------------" >> test_client_results/deployment-results.txt 
    wait_period=$(($wait_period+1))
    if [ $wait_period -gt 3000 ];then
       echo "The script successfully ran for 5 minutes, exiting now.."
       break
    fi
done