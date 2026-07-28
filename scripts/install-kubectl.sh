#!/bin/bash

set -e

echo "========================================"
echo "Installing kubectl"
echo "========================================"

KUBECTL_VERSION=$(curl -s https://dl.k8s.io/release/stable.txt)

curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

echo ""
echo "======================================="
echo "kubectl version"
echo "======================================="

kubectl version --client

echo ""
echo "======================================="
echo "======================================="
echo "======================================="
