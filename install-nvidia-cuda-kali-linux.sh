#!/bin/bash

set -e

echo "=============================="
echo " NVIDIA & CUDA Installer for Kali Linux Purple 2025.2"
echo " Compatible with 64-bit systems only"
echo "=============================="

# STEP 1: Check architecture
ARCH=$(uname -m)
if [[ "$ARCH" != "x86_64" ]]; then
  echo "[ERROR] This script only supports x86_64 (64-bit) systems."
  exit 1
fi

# STEP 2: Update system
echo "[1/8] Updating system..."
sudo apt update && sudo apt full-upgrade -y

# STEP 3: Install kernel headers and build tools
KERNEL_VER=$(uname -r)
echo "[2/8] Installing kernel headers for $KERNEL_VER ..."
sudo apt install -y linux-headers-$KERNEL_VER build-essential dkms || {
  echo "[WARNING] Failed to find exact kernel headers. Trying meta-package..."
  sudo apt install -y linux-headers-amd64
}

# STEP 4: Blacklist nouveau driver
echo "[3/8] Blacklisting nouveau driver..."
echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

# STEP 5: Remove old NVIDIA & CUDA packages
echo "[4/8] Removing any existing NVIDIA/CUDA packages..."
sudo apt purge -y '^nvidia-.*' nvidia-cuda-toolkit || true
sudo apt autoremove -y
sudo apt autoclean

# STEP 6: Prompt reboot before continuing
echo "[5/8] Reboot is required to disable nouveau. Please reboot your system."
read -p "Reboot now? (y/n): " confirm
if [[ "$confirm" == "y" ]]; then
  echo "Rebooting..."
  sudo reboot
  exit 0
else
  echo "Please reboot manually and re-run this script to continue installation."
  exit 1
fi
