#!/bin/bash

set -e

echo "====================================================="
echo "\033[31m$(printf "Starting to destroy an ec2 as intended")\033[0m"
echo "====================================================="

cd Terraform/ec2/
terraform init
terraform plan 
terraform destroy -auto-approve
cd ../..

echo "====================================================="
echo "\033[31m$(printf "destroyed an ec2 as intended")\033[0m"
echo "====================================================="

exit 0