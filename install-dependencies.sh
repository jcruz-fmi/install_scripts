#!/bin/bash

# List of required dependencies
deps=("selenium" "numpy" "pandas" "openpyxl" "sqlalchemy" "psycopg2" "simple_salesforce" "python-dotenv")

# Check if each dependency is installed and install it if it is missing
for dep in "${deps[@]}"; do
    if ! python -c "import $dep" &> /dev/null; then
        echo "$dep is not installed. Installing..."
        sudo pip install $dep
    else
        echo "$dep is already installed"
    fi
done

# Check if geckodriver is installed and install it if it is missing
if ! which geckodriver &> /dev/null; then
    echo "geckodriver is not installed. Installing..."
    # Replace the URL with the latest version of geckodriver for your platform
    wget -q -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz
    sudo tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin/
    rm /tmp/geckodriver.tar.gz
else
    echo "geckodriver is already installed"
fi
