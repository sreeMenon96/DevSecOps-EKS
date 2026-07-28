#!/bin/bash

set -e

echo "========================================"
echo "Installing Helm"
echo "========================================"

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo ""
echo "======================================="
echo "Helm Version"
echo "======================================="

helm version

echo ""
echo "======================================="
echo "======================================="
echo "======================================="
