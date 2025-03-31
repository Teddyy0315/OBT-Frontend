#!/bin/bash

# Activate virtual environment
if [ -d "venv" ]; then
    source venv/bin/activate
else
    echo "❌ Virtual environment not found. Run ./install.sh first."
    exit 1
fi

# Set Qt Quick Controls style
export QT_QUICK_CONTROLS_STYLE=Fusion

# Start the app
echo "🚀 Launching the application..."
python3 main.py