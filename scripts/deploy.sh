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