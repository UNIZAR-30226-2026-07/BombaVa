#!/bin/bash

# Automation script for BombaVa Technical Docs setup

echo "Checking for Python 3..."
if ! command -v python3 &> /dev/null
then
    echo "Error: Python 3 is not installed."
    exit 1
fi

echo "Initializing Virtual Environment..."
python3 -m venv .venv

echo "Installing documentation engine and theme..."
./.venv/bin/pip install --upgrade pip
./.venv/bin/pip install -r requirements.txt

echo "------------------------------------------------"
echo "Setup Complete."
echo "Run 'make docs-serve' to view the documentation."
echo "URL: http://127.0.0.1:8000"
echo "------------------------------------------------"