#!/bin/bash

set -e

echo "====================================================="
echo -e "\033[31m$(printf "Starting to create an ec2 for storing tfstate 1st")\033[0m"
echo "====================================================="

cd Terraform/ec2/
terraform init
terraform plan 
terraform apply -auto-approve
cd ../..

echo "====================================================="
echo -e "\033[31m$(printf "created an ec2 as intented")\033[0m"
echo "====================================================="

exit 0