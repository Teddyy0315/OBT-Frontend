#!/bin/bash

echo "🚀 Setting up virtual environment..."

# Create venv if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate venv
source venv/bin/activate

echo "📦 Installing dependencies..."
pip install --upgrade pip
pip install PySide6

# Optional: install Pi hardware libraries (only works on a Pi)
if grep -q "Raspberry Pi" /proc/device-tree/model 2>/dev/null; then
    echo "🍓 Detected Raspberry Pi - installing GPIO tools..."
    pip install RPi.GPIO
fi

# Optional: install dev tools
echo "🛠️ Installing dev tools (black, flake8)..."
pip install black flake8

echo "✅ Done. To activate venv later, run: source venv/bin/activate"