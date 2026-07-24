#!/bin/bash

set -e

echo "========================================"
echo "Scanning Docker Image"
echo "========================================"

trivy image \
devsecops-app:${BUILD_BUILDID}