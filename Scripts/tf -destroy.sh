#!/bin/bash

set -e

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "Starting to destroy an ec2 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

cd Terraform/ec2/
terraform init
terraform plan 
terraform destroy -auto-approve
cd ../..

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "destroyed an ec2 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "Starting to destroy an s3 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

cd Terraform/s3/
terraform init
terraform plan 
terraform destroy -auto-approve 
cd ../..

echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"
echo -e "\033[31m$(printf "destroyed a s3 for storing tfstate 1st")\033[0m"
echo -e "\033[31m$(printf '%.0s=' {1..100}\ndestroy)\033[0m"

exit 0