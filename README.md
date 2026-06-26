# 🟢 Install NVIDIA CUDA — Kali Linux

<p align="center">
  <img src="https://img.shields.io/badge/Kali%20Linux-557C94?style=for-the-badge&logo=kalilinux&logoColor=white" />
  <img src="https://img.shields.io/badge/NVIDIA-CUDA-76B900?style=for-the-badge&logo=nvidia&logoColor=white" />
  <img src="https://img.shields.io/badge/shell-bash-blue?style=for-the-badge&logo=gnu-bash" />
  <img src="https://img.shields.io/badge/arch-64--bit-lightgrey?style=for-the-badge" />
</p>

<p align="center">
  Script universal dan profesional untuk instalasi <strong>NVIDIA Driver</strong> dan <strong>CUDA Toolkit</strong> di Kali Linux dan turunannya (64-bit).
</p>

---

## 📋 Tentang

Script ini dirancang untuk mempermudah proses instalasi NVIDIA Driver dan CUDA Toolkit di **Kali Linux** (serta distribusi turunan Kali berbasis 64-bit) secara otomatis, aman, dan terstruktur dalam dua tahap.

---

## ✅ Langkah Persiapan Manual

Sebelum menjalankan script, pastikan sistem kamu siap dengan langkah-langkah berikut:

### 1. Cek Versi Kernel

```bash
uname -r
```

### 2. Update Repository & Upgrade Sistem

```bash
sudo apt -y update && sudo apt -y full-upgrade
```

### 3. Install Linux Headers

```bash
# Metode utama (sesuai kernel aktif)
sudo apt install linux-headers-$(uname -r)
```

```bash
# Fallback jika metode utama gagal
sudo apt install linux-headers-amd64
```

> ⚠️ **Catatan:** Jika kamu masih menemukan error setelah langkah ini, jalankan perintah berikut dan bagikan outputnya untuk debugging:
> ```bash
> uname -r
> apt policy linux-headers-$(uname -r)
> ```

---

## ⚙️ Instalasi via Script

### Clone Repository

```bash
git clone https://github.com/spyschools/install-nvidia-cuda-kali-linux.git
cd install-nvidia-cuda-kali-linux
```

### Set Permission Script

```bash
chmod +x install-nvidia-cuda-kali-linux.sh
chmod +x install-nvidia-cuda-kali-linux-part2.sh
```

---

## 🚀 Jalankan Instalasi

Proses instalasi dibagi menjadi **2 tahap** — reboot diperlukan di antara keduanya.

### 🔹 Tahap 1 — Instalasi Driver & CUDA

```bash
./install-nvidia-cuda-kali-linux.sh
```

> 🔄 **Setelah selesai, lakukan REBOOT terlebih dahulu:**
> ```bash
> sudo reboot
> ```

---

### 🔹 Tahap 2 — Konfigurasi Post-Reboot

Setelah sistem menyala kembali, masuk ke direktori yang sama dan jalankan:

```bash
./install-nvidia-cuda-kali-linux-part2.sh
```

---

## 📂 Struktur Script

```
install-nvidia-cuda-kali-linux/
├── install-nvidia-cuda-kali-linux.sh       # Tahap 1 — Instalasi utama
├── install-nvidia-cuda-kali-linux-part2.sh # Tahap 2 — Konfigurasi post-reboot
└── README.md
```

---

## 🔍 Verifikasi Instalasi

Setelah tahap 2 selesai, verifikasi instalasi dengan perintah berikut:

```bash
# Cek driver NVIDIA
nvidia-smi

# Cek versi CUDA
nvcc --version
```

---

## 🧰 Kompatibilitas

| Distro | Dukungan |
|---|---|
| Kali Linux (64-bit) | ✅ Didukung |
| Kali Rolling | ✅ Didukung |
| Kali Derivatives (64-bit) | ✅ Didukung |
| 32-bit | ❌ Tidak didukung |

---

## ⚠️ Disclaimer

> Script ini disediakan **apa adanya** untuk keperluan edukasi dan kemudahan instalasi.
> Pastikan kamu melakukan **backup data penting** sebelum menjalankan script instalasi driver.
> Pengguna bertanggung jawab penuh atas penggunaan script ini.

---

## 👤 Author

**SpySchools**
- GitHub: [@spyschools](https://github.com/spyschools)

---

<p align="center">
  Made with ❤️ for the Kali Linux & NVIDIA CUDA community
</p>
