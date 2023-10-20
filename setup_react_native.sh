#!/bin/bash

## NOTE: be sure to replace the following instances in this script before running
# - replace APP_NAME with the name of your application (as a single word, PascalCase. ex. "MyApp")
# - replace 'bashrc' with your preferred shell config. if you don't know what this is (or you prefer bash) you can leave this as is

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install essential libraries
sudo apt install -y build-essential libssl-dev git curl

# Install watchman
sudo apt install -y watchman

# Install yarn
sudo npm install -g yarn

# Install detox for e2e testing
yarn global add detox-cli

# Create Android emulator (You'll need to adjust this for the exact system image you want)
# First, update sdkmanager
$ANDROID_HOME/tools/bin/sdkmanager --update

# Then, install necessary system images and create avd
$ANDROID_HOME/tools/bin/sdkmanager "system-images;android-30;google_apis;x86_64"
echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n APP_NAME -k "system-images;android-30;google_apis;x86_64"
