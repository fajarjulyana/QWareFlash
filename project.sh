#!/bin/bash

# ==========================================
# QWareFlash Project Generator
# Generate dummy structure + files
# Arch Linux / Ubuntu
# ==========================================

set -e

PROJECT="QWareFlash"

echo "[*] Creating project structure..."

mkdir -p $PROJECT

cd $PROJECT

# ROOT FILES
touch README.md
touch LICENSE
touch CMakeLists.txt

# ASSETS
mkdir -p assets/icons
mkdir -p assets/logo
mkdir -p assets/themes

# DOCS
mkdir -p docs

touch docs/architecture.md
touch docs/firehose.md
touch docs/edl_protocol.md
touch docs/build.md

# THIRD PARTY
mkdir -p third_party/pugixml
mkdir -p third_party/spdlog

# SRC
mkdir -p src/app
mkdir -p src/ui/widgets
mkdir -p src/core
mkdir -p src/protocol/firehose
mkdir -p src/protocol/fastboot
mkdir -p src/protocol/usb
mkdir -p src/parser
mkdir -p src/platform/linux
mkdir -p src/platform/common
mkdir -p src/utils

# MAIN
touch src/main.cpp

# APP
touch src/app/Application.cpp
touch src/app/Application.hpp

# UI
touch src/ui/MainWindow.cpp
touch src/ui/MainWindow.hpp
touch src/ui/DeviceTable.cpp
touch src/ui/FlashPage.cpp
touch src/ui/LogPanel.cpp

# CORE
touch src/core/DeviceManager.cpp
touch src/core/FlashManager.cpp
touch src/core/ProgressManager.cpp
touch src/core/Logger.cpp

# FIREHOSE
touch src/protocol/firehose/FirehoseClient.cpp
touch src/protocol/firehose/FirehoseTransport.cpp
touch src/protocol/firehose/Sahara.cpp
touch src/protocol/firehose/FirehoseXML.cpp

# FASTBOOT
touch src/protocol/fastboot/FastbootClient.cpp

# USB
touch src/protocol/usb/USBDevice.cpp
touch src/protocol/usb/USBMonitor.cpp

# PARSER
touch src/parser/RawProgramParser.cpp
touch src/parser/PatchParser.cpp
touch src/parser/XMLValidator.cpp

# PLATFORM
touch src/platform/linux/UdevMonitor.cpp
touch src/platform/linux/Permissions.cpp
touch src/platform/common/Process.cpp

# UTILS
touch src/utils/FileUtils.cpp
touch src/utils/StringUtils.cpp
touch src/utils/ThreadPool.cpp
touch src/utils/CRC32.cpp

# RESOURCES
mkdir -p resources/udev
mkdir -p resources/mime

touch resources/qwareflash.desktop
touch resources/udev/99-qwareflash.rules

# FIRMWARE
mkdir -p firmware/examples

# SCRIPTS
mkdir -p scripts

touch scripts/build_arch.sh
touch scripts/build_ubuntu.sh
touch scripts/package_deb.sh
touch scripts/package_pkgbuild.sh

# BUILD
mkdir -p build

# ==========================================
# DUMMY CONTENTS
# ==========================================

cat > src/main.cpp << 'EOF'
#include <iostream>

int main()
{
    std::cout << "QWareFlash Starting..." << std::endl;
    return 0;
}
EOF

cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.16)

project(QWareFlash)

set(CMAKE_CXX_STANDARD 20)

add_executable(QWareFlash
    src/main.cpp
)
EOF

cat > README.md << 'EOF'
# QWareFlash

Native Qualcomm EDL Flash Tool
for Arch Linux and Ubuntu.
EOF

cat > LICENSE << 'EOF'
MIT License
EOF

# Make scripts executable
chmod +x scripts/*.sh

echo ""
echo "[✓] QWareFlash dummy project generated successfully!"
echo ""
echo "Path:"
pwd
echo ""
