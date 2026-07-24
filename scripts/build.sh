#!/bin/bash

set -e

echo "========================================"
echo "Installing Node.js Dependencies"
echo "========================================"

cd app

npm install

echo ""
echo "========================================"
echo "Starting Application Validation"
echo "========================================"

timeout 10s npm start || true

echo ""
echo "========================================"
echo "Building Docker Image"
echo "========================================"

IMAGE_NAME=${IMAGE_NAME:-devsecops-app}
IMAGE_TAG=${BUILD_BUILDID}

docker build \
    -t ${IMAGE_NAME}:${IMAGE_TAG} \
    .

echo ""
echo "========================================"
echo "Docker Images"
echo "========================================"

docker images