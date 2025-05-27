#!/bin/bash

# Check if environment is provided
if [ -z "$1" ]; then
    echo "Please provide an environment (dev/staging/prod)"
    exit 1
fi

ENVIRONMENT=$1

# Change to the environment directory
cd "environments/$ENVIRONMENT"

# Initialize Terraform
terraform init

# Plan the changes
terraform plan -out=tfplan

# Ask for confirmation
read -p "Do you want to apply these changes? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Apply the changes
    terraform apply tfplan
else
    echo "Deployment cancelled"
    exit 1
fi 