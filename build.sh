#!/usr/bin/env bash
echo "========================================================================"
echo "==                                                                    =="
echo "==                   Push Docker Image on ECR Registry!               =="
echo "==                                                                    =="
echo "========================================================================"
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
        exit 1
fi
terraform_action=$1
# Moving to the specific folder to get terraform scripts
cd ./terraform/environments/dev/us-west-2/management/
# Initializing terraform
terraform init
if [ $terraform_action == "plan" ]
then
	# View the terraform plan, which shows the list of resources to be created.
	terraform plan
elif [ $terraform_action == "apply" ]
then
	# Apply the terraform script to create the resources on AWS environment
	terraform apply -auto-approve
	cd /home/ubuntu/docker/
	docker build .
	aws configure set aws_access_key_id AKIA3SVNO4LD5UWC5LHJ
	aws configure set aws_secret_access_key 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
	"$(aws --no-verify-ssl ecr get-login --no-include-email --region us-west-2)"
	docker tag ubuntu:latest 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest
	docker push 796006474439.dkr.ecr.us-west-2.amazonaws.com/processlink:latest
elif [ $terraform_action == "destroy" ]
then
	# Destroy the terraform script to remove the resources on AWS environment
	terraform destroy -auto-approve
fi
