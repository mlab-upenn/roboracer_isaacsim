#!/bin/bash
set -e

# Fix missing NVIDIA Vulkan ICD
if [ ! -f "/etc/vulkan/icd.d/nvidia_icd.json" ]; then
    echo "NVIDIA Vulkan ICD missing. Generating..."
    mkdir -p /etc/vulkan/icd.d
    echo '{
        "file_format_version" : "1.0.0",
        "ICD": {
            "library_path": "libGLX_nvidia.so.0",
            "api_version" : "1.3.260"
        }
    }' > /etc/vulkan/icd.d/nvidia_icd.json
    echo "Generated /etc/vulkan/icd.d/nvidia_icd.json"
fi

# Check if Isaac Sim has been built
# The build output is typically in _build folder
if [ ! -d "/root/isaacsim/_build" ]; then
    echo "Isaac Sim build not found at /root/isaacsim/_build."
    echo "Starting build process..."
    cd /root/isaacsim
    # Automatically accept EULA
    echo "yes" | ./build.sh
else
    echo "Isaac Sim build detected."
fi

# Execute the passed command
exec "$@"
