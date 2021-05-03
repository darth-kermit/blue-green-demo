# Tristan Oetker - Blizzard Blue/Green Demo

## Architecture Diagram

![Architecture Diagram](/assets/images/diagram.jpeg)

## Project Overview
### i.            Start v1 of the application

First I decided to containerize the sample application by writing a Dockerfile. After writing the Dockerfile for the
sample app, I built and tested it locally to ensure the container ran correctly and that I could reach the /version endpoint.
Once I had a successful Dockerfile for the sample app, I built, tagged, and pushed it to a private Amazon ECR in my account.
I then created a new version of the app, where I changed the version from "0.0.1" to "0.0.2".
I then built and tagged this image differently and pushed it to ECR as well.

Finally, I needed to get the application up and running. I chose to use Amazon ECS Fargate to host the application because it was familiar, lightweight, and integrated nicely with the tools required for my deployment. 

At this point, I created an ECS cluster, task definition, and task to get the app up and running. After configuring the security group, I was able to reach the application's /version endpoint. 
Awesome.
### ii.            Write a simple test client to call {service_base_url}/version repeatedly

To create the test client I created a simple shell script which calls the application's version endpoint
repeatedly for a specified amount of time. While it is calling the endpoint, the script writes to a text file
in the test_client_results directory which allows me to verify that no requests are failing and that the deployment
happened seemlessly. 

### iii.            Update the version of the sample application

To update the version of the sample application, I can manually update the task definition on ECS by creating
a new revision with the new image. In step iv, I configure additional services which allow me to update the 
task definition which will trigger the blue/green deployment.

### iv.            Utilize your deployment strategy to execute a blue/green deploy of test application v2




### v Capture the output of your test client to show that no requests failed and the version being returned from the sample application changed

After updating the task definition on the ECS service, I start my script which begins curling the application endpoint. 
Once the deployment finishes I can look through the output of the text file and find the first call which returns
the version as "0.0.2". Finally, I can check the call before it and make sure it correctly returned version "0.0.1"
and not any errors. 

## Project Demo Screencast with AWS Components

## Future Work

- Finish creating a full deployment pipeline using a Github, CodePipeline, CodeBuild, and CodeDeploy.
  
  The deployment pipeline would trigger on a code change in the specified git branch. The pipeline would then
  take the application code and build a new docker image with CodeBuild and push it to ECR. It would then pass the
  new image tag as build artifact and updat the task definition configuration automatically using CodeDeploy. This 
  would then trigger the ECS blue/green deployment automatically, removing the manual steps of pushing the application
  image and updating the task definition accordingly.

- Create "one-click" deployment of pipeline infrastructure using Terraform or Cloudformation IaC. Given more time, I
  would write infrastructure as code to stand up all of the resources in a repeatable and automated way, so that the
  blue/green deployment project can be easily adopted by anyone with a free-tier AWS account.

- Further secure the AWS resources. I need to go back and ensure least privilege of all AWS resources that were deployed.  

- Replace line 5 in my Dockefile with better package management for the application. I would prefer to have a 
  requirements.txt file with the specific packages and versions used by the sample app, instead of hardcoding the
  pip install in the Dockerfile.