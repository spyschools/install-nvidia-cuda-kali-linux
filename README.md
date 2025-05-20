# install-nvidia-cuda-kali-linux
Here is a universal and professional script to install NVIDIA Driver and CUDA Toolkit on Kali Linux version 2025.2 (and other 64-bit Kali derivatives)
Command Steps
Check kernel uname -r
Update repo 
# sudo apt -y update && sudo apt -y full-upgrade
Install headers 
# sudo apt install linux-headers-$(uname -r)
Or fallback 
# sudo apt install linux-headers-amd64

If you still encounter errors after this step, I can help debug from the output of uname -r and apt policy linux-headers-$(uname -r)
# git clone install-nvidia-cuda-kali-linux.git 
# cd install-nvidia-cuda-kali-linux
# chmod +x install-nvidia-cuda-kali-linux.sh
# chmod +x install-nvidia-cuda-kali-linux-part2.sh

./install-nvidia-cuda-kali-linux.sh
# (After reboot)
./install-nvidia-cuda-kali-linux-part2.sh

