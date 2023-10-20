
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
ANDROID_STUDIO_URL= "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.2.1.9/android-studio-2023.2.1.9-linux.tar.gz"
DOWNLOADS_DIR="$HOME/Downloads"
echo -e "${BLUE}Downloading Android Studio${NC}"
wget -P $DOWNLOADS_DIR $ANDROID_STUDIO_URL

echo -e "${BLUE}Installing Android Studio${NC}"
unzip $DOWNLOADS_DIR/android-studio-ide-*-linux.zip -d $HOME

# Set Android Studio environment variables
echo -e "${BLUE}Setting up Android Studio environment variables${NC}"
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools' >> ~/.bashrc
source ~/.bashrc
