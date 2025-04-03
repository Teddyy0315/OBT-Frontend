#!/bin/bash

echo "? Setting up environment for PyQt5 + QML on Raspberry Pi 5..."

# Ensure system is updated
sudo apt update && sudo apt install -y software-properties-common curl git

# Install Python 3 & pip if missing
if ! command -v python3 &> /dev/null; then
    echo "? Installing Python 3..."
    sudo apt install -y python3
fi

if ! command -v pip3 &> /dev/null; then
    echo "? Installing pip..."
    sudo apt install -y python3-pip
fi

# Install venv support
sudo apt install -y python3-venv

# Create virtual environment with system packages
echo "? Creating virtual environment with system packages..."
python3 -m venv venv --system-site-packages
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install PyQt5 and QML dependencies via apt (NOT pip!)
echo "? Installing PyQt5 and QML system packages..."
sudo apt install -y \
    python3-pyqt5 \
    python3-pyqt5.qtquick \
    python3-pyqt5.qtquickcontrols2 \
    qtdeclarative5-dev \
    qml-module-qtquick-controls \
    qml-module-qtquick-controls2 \
    qml-module-qtquick-layouts \
    qml-module-qtgraphicaleffects \
    libqt5qml5 \
    libqt5quick5 \
    libqt5gui5 \
    libqt5core5a \
    libgl1-mesa-dev \
    libxcb-xinerama0 \
    fonts-roboto

# Install from requirements.txt if it exists
if [ -f "requirements.txt" ]; then
    echo "? Installing Python deps from requirements.txt..."
    pip install -r requirements.txt
fi

echo "? Setup complete."
echo "??  Run your app with: source venv/bin/activate && python3 main.py s"