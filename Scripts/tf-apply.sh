#!/bin/bash

set -e

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "Starting to create an s3 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

cd Terraform/s3/
terraform init
terraform plan 
terraform apply -auto-approve 
cd ../..

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "created a s3 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "Starting to create an ec2 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

cd Terraform/ec2/
terraform init
terraform plan 
terraform apply -auto-approve
cd ../..

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "created an ec2 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

exit 0