📌 Conclusion
Command Steps
Check kernel uname -r
Update repo sudo apt update
Install headers # sudo apt install linux-headers-$(uname -r)
Or fallback # sudo apt install linux-headers-amd64

If you still encounter errors after this step, I can help debug from the output of uname -r and apt policy linux-headers-$(uname -r)


chmod +x install-nvidia-cuda-kali-2025.sh
chmod +x install-nvidia-cuda-kali-2025-part2.sh

./install-nvidia-cuda-kali-2025.sh
# (After reboot)
./install-nvidia-cuda-kali-2025-part2.sh
