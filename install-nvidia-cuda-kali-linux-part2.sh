#!/bin/bash

set -e

echo "=============================="
echo " Continuing NVIDIA & CUDA Installation"
echo "=============================="

# STEP 6: Install driver & CUDA
echo "[6/8] Installing NVIDIA driver and CUDA Toolkit..."
sudo apt update
sudo apt install -y nvidia-driver nvidia-cuda-toolkit

# STEP 7: Load NVIDIA modules
echo "[7/8] Loading NVIDIA modules..."
sudo modprobe nvidia

# STEP 8: Verify installation
echo "[8/8] Verifying installation..."
if nvidia-smi; then
  echo "✅ NVIDIA driver installed successfully."
else
  echo "❌ NVIDIA driver not detected. Please check dmesg/logs."
fi

if command -v nvcc >/dev/null 2>&1; then
  nvcc --version
  echo "✅ CUDA Toolkit installed successfully."
else
  echo "❌ CUDA Toolkit not found."
fi

echo "🚀 Installation complete. A reboot is recommended."
