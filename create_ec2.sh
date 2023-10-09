#!/bin/bash

# Deploy infrastructure using Terraform
echo "Deploying infrastructure with Terraform..."
cd ec2-terraform
terraform init
terraform apply -auto-approve -var-file=env_vars.tfvars 



