#!/bin/bash

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color

# Check if ANDROID_HOME is set
if [ -z "$ANDROID_HOME" ]; then
    echo -e "${RED}ANDROID_HOME is not set. Exiting.${NC}"
    exit 1
fi

# Update sdkmanager
echo -e "${BLUE}Updating sdkmanager...${NC}"
$ANDROID_HOME/tools/bin/sdkmanager --update

# Check for success
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to update sdkmanager. Exiting.${NC}"
    exit 1
fi

# Install necessary system images
echo -e "${BLUE}Installing system images...${NC}"
$ANDROID_HOME/tools/bin/sdkmanager "system-images;android-30;google_apis;x86_64"

# Check for success
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to install system images. Exiting.${NC}"
    exit 1
fi

# Set up environment variables for Android SDK
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc

# Remember to source or restart your terminal
source ~/.bashrc

# Create avd
echo -e "${BLUE}Creating Android Virtual Device (AVD)...${NC}"
echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n APP_NAME -k "system-images;android-30;google_apis;x86_64"

# Check for success
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to create AVD. Exiting.${NC}"
    exit 1
fi

echo -e "${GREEN}Script completed successfully!${NC}"
