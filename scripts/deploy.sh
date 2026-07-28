#!/bin/bash

set -e

echo "========================================"
echo "Configuring kubeconfig"
echo "========================================"

aws eks update-kubeconfig --name ${EKS_CLUSTER_NAME} --region ${AWS_REGION}

echo ""
echo "========================================"
echo "Checking Cluster Connectivity"
echo "========================================"

kubectl get nodes

echo ""
echo "========================================"
echo "Deploying Application using Helm"
echo "========================================"

helm upgrade --install devsecops-app helm/devsecops-app \
  --set image.repository=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY} \
  --set image.tag=${IMAGE_TAG}

echo ""
echo "========================================"
echo "Waiting for Deployment Rollout"
echo "========================================"

kubectl rollout status deployment/devsecops-app

echo ""
echo "========================================"
echo "Pods"
echo "========================================"

kubectl get pods

echo ""
echo "========================================"
echo "Services"
echo "========================================"

kubectl get svc

echo ""
echo "========================================"
echo "Deployment Completed Successfully"
echo "========================================"