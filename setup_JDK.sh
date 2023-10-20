#!/bin/bash

# Update system packages
sudo apt update

# Install OpenJDK 11
sudo apt install -y openjdk-11-jdk

# Verify the installation
if java -version 2>&1 | grep -q "11"; then
    echo "JDK 11 successfully installed!"
else
    echo "Failed to install JDK 11."
    exit 1
fi

# Find the path of the installed JDK
JAVA_PATH=$(update-alternatives --config java 2>/dev/null | grep '*\s' | awk '{print $3}')
JAVA_HOME_DIR=$(dirname $(dirname $JAVA_PATH))

# Check if JAVA_HOME is already set up
if grep -q "JAVA_HOME=" ~/.bashrc; then
    echo "JAVA_HOME already exists in ~/.bashrc."
else
    echo "Setting up JAVA_HOME and updating PATH in ~/.bashrc."
    echo "export JAVA_HOME=$JAVA_HOME_DIR" >> ~/.bashrc
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc
fi

# Inform the user about the next steps
echo "Installation and configuration completed!"
echo "Please run 'source ~/.bashrc' to reflect the changes in your current terminal session."
