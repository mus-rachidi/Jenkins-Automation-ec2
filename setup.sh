#!/bin/bash

# Deploy container Jenkins
cd ec2-terraform

public_ip=$(terraform output -raw public_ip)
echo $public_ip
echo "Deploying app with Jenkins..."

cd ../

sed -Ei "s/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/${public_ip}/g" "inventory.ini"

ansible-playbook -i inventory.ini jenkins_deploy.yml 

echo "App deployment completed."