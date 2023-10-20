#!/bin/bash

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color

# Install required packages
echo -e "${BLUE}Installing required packages${NC}"
sudo apt update
sudo apt install -y unzip lib32stdc++6 lib32z1

# Download and Install Android Studio
ANDROID_STUDIO_URL="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.2.1.9/android-studio-2023.2.1.9-linux.tar.gz"
DOWNLOADS_DIR="$HOME/Downloads"
echo -e "${BLUE}Downloading Android Studio${NC}"
if wget -P $DOWNLOADS_DIR $ANDROID_STUDIO_URL; then
    echo -e "${GREEN}Download successful!${NC}"
else
    echo -e "${RED}Download failed! Exiting.${NC}"
    exit 1
fi

echo -e "${BLUE}Installing Android Studio${NC}"
if tar -xzf $DOWNLOADS_DIR/android-studio-2023.2.1.9-linux.tar.gz -C $HOME; then
    echo -e "${GREEN}Installation successful!${NC}"
else
    echo -e "${RED}Installation failed! Exiting.${NC}"
    exit 1
fi

# Set Android Studio environment variables
echo -e "${BLUE}Setting up Android Studio environment variables${NC}"
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools' >> ~/.bashrc

# Reload .bashrc to make changes effective
source ~/.bashrc
echo -e "${GREEN}Setup completed!${NC}"
