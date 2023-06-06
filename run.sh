#!/bin/bash

# Deploy infrastructure using Terraform
echo "Deploying infrastructure with Terraform..."
cd ec2-terraform
terraform init
terraform apply -var-file=env_vars.tfvars

public_ip=$(terraform output -raw public_ip)

# Deploy container Jenkins
echo "Deploying app with Jenkins..."

cd ../

sed -i "s/your_public_ip/$public_ip/g" inventory.ini

ansible-playbook -i inventory.ini jenkins_deploy.yml 

echo "App deployment completed."
