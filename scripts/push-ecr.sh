#!/bin/bash

set -e

echo "========================================"
echo "Configuring AWS Credentials"
echo "========================================"

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}

echo ""
echo "========================================"
echo "AWS CLI Version"
echo "========================================"

aws --version

echo ""
echo "========================================"
echo "Logging into AWS ECR"
echo "========================================"

aws ecr get-login-password \
| docker login \
    --username AWS \
    --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com


echo ""
echo "========================================"
echo "Tagging Docker Image"
echo "========================================"

docker tag \
    ${IMAGE_NAME}:${IMAGE_TAG} \
    ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}:${IMAGE_TAG}

echo ""
echo "========================================"
echo "Docker Image Successfully Published"
echo "========================================"