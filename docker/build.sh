#!/bin/bash
set -e

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Go to project root
cd "$SCRIPT_DIR/.."

# Build the image
echo "Building Docker image..."
docker build -t roboracer_isaacsim:5.1 -f docker/Dockerfile .
