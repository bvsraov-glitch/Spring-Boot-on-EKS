#!/bin/bash
set -e

# Load .env if present
if [ -f ../.env ]; then
    set -a
    . ../.env
    set +a
fi

# Prompt for missing values
if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    read -p "AWS Access Key ID: " AWS_ACCESS_KEY_ID
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    read -p "AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
fi
if [ -z "$AWS_DEFAULT_REGION" ]; then
    read -p "Default region name [us-east-1]: " AWS_DEFAULT_REGION
    AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-us-east-1}
fi
if [ -z "$AWS_DEFAULT_OUTPUT" ]; then
    read -p "Default output format [json]: " AWS_DEFAULT_OUTPUT
    AWS_DEFAULT_OUTPUT=${AWS_DEFAULT_OUTPUT:-json}
fi

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set region "$AWS_DEFAULT_REGION"
aws configure set output "$AWS_DEFAULT_OUTPUT"

echo "AWS CLI configured successfully."
