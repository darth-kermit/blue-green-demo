# Tristan Oetker - Blizzard Blue/Green Demo

## Project Overview
### i.            Start v1 of the application

First I decided to containerize the sample application by writing a Dockerfile. After writing the Dockerfile for the
sample app, I built and tested it locally to ensure the container ran correctly and that I could reach the /version endpoint.
Once I had a successful Dockerfile for the sample app, I built, tagged, and pushed it to a private Amazon ECR in my account.

Finally, I needed to get the application up and running. I chose to use Amazon ECS Fargate to host the application because it was familiar, lightweight, and integrated nicely with the tools required for my deployment. 

At this point, I created an ECS cluster, task definition, and task to get the app up and running. After configuring the security group, I was able to reach the application's /version endpoint. 
Awesome.
### ii.            Write a simple test client to call {service_base_url}/version repeatedly

To create the test client I created a simple shell script which calls the application's version endpoint
repeatedly for a specified amount of time. While it is calling the endpoint, the script writes to a text file
in the test_client_results directory which allows me to verify that no requests are failing and that the deployment
happened seemlessly. 

### iii.            Update the version of the sample application


### iv.            Utilize your deployment strategy to execute a blue/green deploy of test application v2
### v Capture the output of your test client to show that no requests failed and the version being returned from the sample application changed

## Final System Architecture

## Project Demo Screencast with AWS Components

## Future Work

## Project 