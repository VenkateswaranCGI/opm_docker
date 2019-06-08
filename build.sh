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
elif [ $terraform_action == "destroy" ]
then
	# Destroy the terraform script to remove the resources on AWS environment
	terraform destroy -auto-approve
fi
