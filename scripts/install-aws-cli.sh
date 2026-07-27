#!/bin/bash

set -e

echo "========================================"
echo "Checking AWS CLI"
echo "========================================"

if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI is already installed."
else
    echo "Installing AWS CLI..."

    sudo apt-get update

    sudo apt-get install -y awscli
fi

echo ""

aws --version