# QWareFlash

MiFlash Tool Native Linux khusus **Arch Linux** dan **Ubuntu**
Dibuat dengan C++ modern + GTKmm + Firehose Qualcomm Native Engine.

---

## Tentang Project

**QWareFlash** adalah tool flashing Qualcomm EDL (Emergency Download Mode) untuk Linux yang dibuat sebagai alternatif native Linux dari MiFlash Windows.

Target utama:

* Arch Linux
* Ubuntu
* Debian-based distro
* KDE / GNOME / XFCE

Fokus project:

* Native Linux
* Fastboot + EDL
* Firehose flashing
* Multi-device support
* GUI modern GTKmm
* XML parser rawprogram.xml
* Realtime flashing progress
* Stable untuk service center dan teknisi

---

# Arsitektur Project

```text
QWareFlash/
├── README.md
├── LICENSE
├── CMakeLists.txt
├── assets/
│   ├── icons/
│   ├── logo/
│   └── themes/
│
├── docs/
│   ├── architecture.md
│   ├── firehose.md
│   ├── edl_protocol.md
│   └── build.md
│
├── third_party/
│   ├── pugixml/
│   └── spdlog/
│
├── src/
│   ├── main.cpp
│   │
│   ├── app/
│   │   ├── Application.cpp
│   │   └── Application.hpp
│   │
│   ├── ui/
│   │   ├── MainWindow.cpp
│   │   ├── MainWindow.hpp
│   │   ├── DeviceTable.cpp
│   │   ├── FlashPage.cpp
│   │   ├── LogPanel.cpp
│   │   └── widgets/
│   │
│   ├── core/
│   │   ├── DeviceManager.cpp
│   │   ├── FlashManager.cpp
│   │   ├── ProgressManager.cpp
│   │   └── Logger.cpp
│   │
│   ├── protocol/
│   │   ├── firehose/
│   │   │   ├── FirehoseClient.cpp
│   │   │   ├── FirehoseTransport.cpp
│   │   │   ├── Sahara.cpp
│   │   │   └── FirehoseXML.cpp
│   │   │
│   │   ├── fastboot/
│   │   │   └── FastbootClient.cpp
│   │   │
│   │   └── usb/
│   │       ├── USBDevice.cpp
│   │       └── USBMonitor.cpp
│   │
│   ├── parser/
│   │   ├── RawProgramParser.cpp
│   │   ├── PatchParser.cpp
│   │   └── XMLValidator.cpp
│   │
│   ├── platform/
│   │   ├── linux/
│   │   │   ├── UdevMonitor.cpp
│   │   │   └── Permissions.cpp
│   │
│   │   └── common/
│   │       └── Process.cpp
│   │
│   └── utils/
│       ├── FileUtils.cpp
│       ├── StringUtils.cpp
│       ├── ThreadPool.cpp
│       └── CRC32.cpp
│
├── resources/
│   ├── qwareflash.desktop
│   ├── udev/
│   │   └── 99-qwareflash.rules
│   └── mime/
│
├── firmware/
│   └── examples/
│
├── scripts/
│   ├── build_arch.sh
│   ├── build_ubuntu.sh
│   ├── package_deb.sh
│   └── package_pkgbuild.sh
│
└── build/
```

---

# Alur Program

## 1. Startup

```text
main.cpp
   ↓
Application
   ↓
GTK MainWindow
   ↓
DeviceManager start monitoring USB
```

---

## 2. Deteksi Device Qualcomm

QWareFlash memonitor:

* Qualcomm HS-USB QDLoader 9008
* Fastboot devices
* ADB devices

Menggunakan:

* libusb
* udev monitor
* lsusb parser

---

## 3. User Load Firmware

User memilih folder firmware:

```text
firmware/
├── prog_firehose_ddr.elf
├── rawprogram0.xml
├── patch0.xml
└── images/
```

Parser membaca:

* rawprogram.xml
* patch.xml
* partition mapping

---

## 4. Firehose Handshake

Tahapan komunikasi:

```text
USB Connect
   ↓
Sahara Protocol
   ↓
Upload Firehose ELF
   ↓
Switch to Firehose Mode
   ↓
Ready Flashing
```

---

## 5. Flashing Process

QWareFlash melakukan:

```text
Read XML
   ↓
Parse partition
   ↓
Send image chunk
   ↓
Write to storage
   ↓
Verify checksum
   ↓
Next partition
```

---

## 6. Realtime Progress UI

GUI menampilkan:

* Progress bar
* Kecepatan transfer
* Status partisi
* Log realtime
* Error handler

---

# Teknologi yang Digunakan

| Komponen     | Teknologi      |
| ------------ | -------------- |
| Bahasa       | C++20          |
| GUI          | GTKmm 4        |
| Build System | CMake          |
| XML Parser   | pugixml        |
| Logging      | spdlog         |
| USB          | libusb         |
| Threading    | std::thread    |
| Packaging    | PKGBUILD + DEB |

---

# Dependensi Arch Linux

```bash
sudo pacman -S \
gtkmm-4.0 \
cmake \
gcc \
pkgconf \
libusb \
pugixml \
spdlog
```

---

# Dependensi Ubuntu

```bash
sudo apt install \
build-essential \
cmake \
libgtkmm-4.0-dev \
libusb-1.0-0-dev \
libpugixml-dev \
libspdlog-dev
```

---

# Build Arch Linux

```bash
mkdir build
cd build

cmake ..
make -j$(nproc)
```

---

# Build Ubuntu

```bash
mkdir build
cd build

cmake ..
make -j$(nproc)
```

---

# Roadmap

## Phase 1

* [x] Struktur project
* [x] GTKmm MainWindow
* [x] USB monitor
* [x] XML parser
* [ ] Firehose basic

---

## Phase 2

* [ ] Sahara protocol
* [ ] Flashing engine
* [ ] Progress realtime
* [ ] Multi-device

---

## Phase 3

* [ ] Drag & drop firmware
* [ ] Firmware verification
* [ ] Auto detect Xiaomi firmware
* [ ] Theme engine

---

## Phase 4

* [ ] Secure boot bypass research
* [ ] Plugin architecture
* [ ] Online firmware database
* [ ] OTA unpacker

---

# Keamanan

QWareFlash berjalan langsung ke Qualcomm EDL interface.

Gunakan dengan hati-hati karena kesalahan flashing dapat menyebabkan:

* hardbrick
* bootloop
* kehilangan data

---

# Branding

```text
QWareFlash
by QWare, Inc
Wave Master
```

---

# Author

**Fajar Julyana**
Founder of QWare, Inc

Bandung, Indonesia

Email:
[fajarjulyana1@gmail.com](mailto:fajarjulyana1@gmail.com)
