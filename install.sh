#!/bin/bash

echo "🔧 Setting up environment..."

# Ensure system is updated
sudo apt update && sudo apt install -y software-properties-common curl git

# Install Python 3 & pip if missing
if ! command -v python3 &> /dev/null; then
    echo "⏬ Installing Python 3..."
    sudo apt install -y python3
fi

if ! command -v pip3 &> /dev/null; then
    echo "⏬ Installing pip..."
    sudo apt install -y python3-pip
fi

# Optional: install venv support
sudo apt install -y python3-venv

# Create virtual environment
echo "🐍 Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install system Qt dev + QML dependencies
sudo apt install -y \
    libgl1-mesa-dev \
    libxcb-xinerama0 \
    qt6-base-dev \
    qt6-declarative-dev \
    qt6-qmltooling-plugins \
    libqt6core6 \
    libqt6gui6 \
    libqt6qml6 \
    qml6-module-qtquick \
    qml6-module-qtquick-controls \
    qml6-module-qtquick-layouts

# Install PyQt6
echo "📦 Installing PyQt6..."
pip install PyQt6

# Install from requirements.txt if exists
if [ -f "requirements.txt" ]; then
    echo "📄 Installing from requirements.txt..."
    pip install -r requirements.txt
fi

echo "✅ Setup complete."
echo "💡 Tip: Add this to your Python main file before creating QApplication:"
echo '    import os'
echo '    os.environ["QT_QUICK_BACKEND"] = "software"'
echo "▶️  Run your app with: source venv/bin/activate && python3 main.py"