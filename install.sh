#!/bin/bash
set -e

# Avocado installer stub
echo "Avocado Installation Script"
echo "---------------------------"

OS=$(uname -s | tr "[:upper:]" "[:lower:]")
ARCH=$(uname -m)

if [ "$OS" != "linux" ]; then
    echo "Error: Only Linux is supported currently."
    exit 1
fi

if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
else
    echo "Error: Architecture $ARCH not supported yet."
    exit 1
fi

echo "Detected $OS-$ARCH"

# In a real scenario, this would download from a versioned URL
# curl -L -O https://github.com/Rta-Forge/avocado-on-toast/releases/download/v0.1.0/avocado-linux-amd64.tar.gz

echo "To install Avocado, download the latest release from:"
echo "https://github.com/Rta-Forge/avocado-on-toast/releases"
echo ""
echo "Then unpack and run:"
echo "tar -xzf avocado-linux-amd64.tar.gz"
echo "./avocado --help"
