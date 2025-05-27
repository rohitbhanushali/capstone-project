#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print usage
usage() {
  echo -e "${YELLOW}Usage:${NC} $0 <environment>"
  echo -e "  environment: dev, staging, prod"
  echo -e "\n${YELLOW}Note:${NC} This script must be run from the terraform/scripts directory"
  exit 1
}

# Function to print error and exit
error() {
  echo -e "${RED}Error:${NC} $1"
  exit 1
}

# Function to print success message
success() {
  echo -e "${GREEN}Success:${NC} $1"
}

# Function to print info message
info() {
  echo -e "${YELLOW}Info:${NC} $1"
}

# Check if script is run from the correct directory
if [[ ! -f "$(dirname "$0")/deploy.sh" ]]; then
  error "This script must be run from the terraform/scripts directory"
fi

# Exit on error
set -e

# Check if environment is provided
if [ -z "$1" ]; then
  error "Environment not provided"
  usage
fi

ENVIRONMENT=$1

# Check if environment is valid
if [[ ! "$ENVIRONMENT" =~ ^(dev|staging|prod)$ ]]; then
  error "Invalid environment. Must be one of: dev, staging, prod"
fi

# Change to the environment directory
ENV_DIR="$(dirname "$0")/../environments/$ENVIRONMENT"
if [[ ! -d "$ENV_DIR" ]]; then
  error "Environment directory not found: $ENV_DIR"
fi

cd "$ENV_DIR" || error "Could not change to environment directory: $ENV_DIR"

info "Deploying to $ENVIRONMENT environment..."

# Initialize Terraform
info "Running terraform init..."
terraform init
success "Terraform initialized"

# Plan the changes
info "Running terraform plan..."
terraform plan -out=tfplan
success "Terraform plan created"

# Ask for confirmation
echo
read -p "Do you want to apply these changes? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  # Apply the changes
  info "Applying changes..."
  terraform apply tfplan
  success "Deployment completed successfully!"
else
  info "Deployment cancelled by user"
  exit 0
fi 