# ---------------------------------------------------------------------------- #


## Download Node.js®

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.15.0".
nvm current # Should print "v22.15.0".

# Verify npm version:
npm -v # Should print "10.9.2".



# ---------------------------------------------------------------------------- #


# 🛠️ Java JDK Setup for React Native (Ubuntu)


## 📥 Download & Install JDK (Optional via apt)

## ✅ Update & Upgrade
sudo apt update
sudo apt upgrade -y

## 🔍 Check Available OpenJDK Versions
apt-cache search openjdk | grep openjdk-21

## 📦 Install JDK and Required Tools
sudo apt install openjdk-21-jdk watchman
sudo apt install openjdk-17-jdk nodejs npm watchman git curl unzip zip -y

## Verify:
java -version


# ---------------------------------------------------------------------------- #


## 📥 Manual JDK Installation from Adoptium (Recommended)

### URL
🔗 URL: https://adoptium.net/temurin/releases/?os=linux&arch=x64&package=jdk

### 📏 Check System Architecture
getconf LONG_BIT

### 📁 Know Your Current Directory
pwd

### ⚙️ Set Environment Variables
nano ~/.bashrc

### Add JDK path
export PATH=/home/ashokkumar/Downloads/SOFTWARES/OpenJDK21U-jdk_x64_linux_hotspot_21.0.7_6/jdk-21.0.7+6/bin:$PATH

### 🔄 Reload Shell
source ~/.bashrc

### ✅ Verify Installation
java -version

## 💾 How to Save and Exit in Nano

    After editing:

        Press Ctrl + O → Write Out (save)

        Press Enter → Confirm filename

        Press Ctrl + X → Exit editor


# ---------------------------------------------------------------------------- #


# 🛠️ Android Studio Setup for React Native (Ubuntu)

## ✅ Download & Install Android Studio

- ✅ Step 1: Download Android Studio ZIP
   
   - 📥 Official Link: 👉 https://developer.android.com/studio


- ✅ Step 2: Extract the ZIP File

    - cd ~/Downloads
    - unzip android-studio-*-linux.zip -d ~/android-studio
    
    - Optional: Move to /opt for global use
        sudo mv ~/android-studio /opt/android-studio (optional) 


- ✅ Step 3: Run Android Studio

    - cd ~/android-studio/bin
    - ./studio.sh


- ✅ Step 4: (Optional) Create Desktop Shortcut

    - Once Android Studio launches:
    - Go to Tools → Create Desktop Entry
    - Check "Create entry for all users" (optional)
    - Click OK


- ✅ Step 5: Add to PATH (Optional) for terminal access)

    - echo 'export PATH="$PATH:$HOME/android-studio/bin"' >> ~/.bashrc
    - source ~/.bashrc



## 🧰 Set Up SDK & Required Tools in Android Studio

## 🔧 Open SDK Manager

    Install the following:

        ✅ Android SDK

        ✅ SDK Platform Tools

        ✅ SDK Build Tools

    Recommended Android Versions:

        Android 14 (API 34)

        Android 13 (API 33)

        Android 12 (API 31)

    Tools to check inside SDK Manager:

        Android SDK Build Tools 35

        Android Emulator

        Android SDK Platform Tools


# Create a Desktop Shortcut

## Create a .desktop file:
nano ~/.local/share/applications/android-studio.desktop


[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Exec=/home/ashokkumar/Downloads/SOFTWARES/android-studio-2024.3.2.14-linux/android-studio/bin/studio.sh
Icon=/home/ashokkumar/Downloads/SOFTWARES/android-studio-2024.3.2.14-linux/android-studio/bin/studio.png
Comment=Android IDE
Categories=Development;IDE;
Terminal=false


## Save and exit (Ctrl+O → Enter → Ctrl+X)

## Then make it executable:
chmod +x ~/.local/share/applications/android-studio.desktop


# ---------------------------------------------------------------------------- #

# 🛠 4. Set Environment Variables

# Edit ~/.bashrc or ~/.zshrc:

    # Open bash
    - nano ~/.bashrc

# 🟩 Java JDK 21 path
    export PATH="/home/ashokkumar/Downloads/SOFTWARES/OpenJDK21U-jdk_x64_linux_hotspot_21.0.7_6/jdk-21.0.7+6/bin:$PATH"
    export PATH="$JAVA_HOME/bin:$PATH"

# 🟩 Android Studio path
    export PATH="$PATH:/home/ashokkumar/Downloads/SOFTWARES/android-studio-2024.3.2.14-linux/android-studio/bin"

# 🟩 Android SDK setup
    export ANDROID_HOME=$HOME/Android/Sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/platform-tools

    # Apply changes:
        - source ~/.bashrc

    # Verify:
        - echo $ANDROID_HOME
        - echo $JAVA_HOME

- OTHER WAY
# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH


# ---------------------------------------------------------------------------- #


# 📱Install React Native CLI

npm install -g react-native-cli

# Expo
npm install -g expo-cli
expo init MyApp


# ---------------------------------------------------------------------------- #

# 🛠️ Install Watchman

## Step 1: Update Packages
sudo apt update

## Step 2: Install Prerequisites
sudo apt install -y autoconf automake build-essential libtool pkg-config python3 libssl-dev
sudo apt install -y autoconf automake build-essential python-dev libtool libssl-dev libgmp-dev \
pkg-config libsqlite3-dev libpcre3-dev libbz2-dev

## Step 3: Clone Watchman from GitHub
git clone https://github.com/facebook/watchman.git
cd watchman

## Step 4: Checkout a Stable Release
git checkout v2025.05.05.00

## Step 5: Build and Install
./autogen.sh
./configure
make
sudo make install

## Step 6: Verify Installation
watchman --version


# ✅ Recommended Installation for Ubuntu (As Per Official Docs)

## 🔽 Download the .deb from official Watchman GitHub releases
👉 https://github.com/facebook/watchman/releases


wget https://github.com/facebook/watchman/releases/download/v2023.06.05.00/watchman_2023.06.05.00_amd64.deb


https://github.com/facebook/watchman/releases/tag/v2025.05.05.00



# Using Command in Terminal
sudo apt install watchman



✅ Step 3: Install Navigation Dependencies

npm install @react-navigation/native
npm install react-native-screens react-native-safe-area-context react-native-gesture-handler
npm install @react-navigation/native-stack
npx pod-install ios



# ---------------------------------------------------------------------------- #
    

# Install ADB (Android Debug Bridge):
sudo apt install android-tools-adb android-tools-fastboot
adb version


# ---------------------------------------------------------------------------- #


## Start React Native App


    ./studio.sh

    cd Desktop/ReactApp/

    npx react-native init RentifyApp
    npx react-native@latest init RentifyApp
    npx @react-native-community/cli init RentifyApp    # ✅ Best practice: latest CLI

    cd RentifyApp

    npx react-native run-android


## Run React Native App
    npm start
    npm run android
    
# Start Metro	
npx react-native start

# Run on Android
npx react-native run-android

# (or) iOS on macOS
npx react-native run-ios
    
  

# ---------------------------------------------------------------------------- #


# 🧠 VS Code Setup (Recommended Editor)
➤ Install VS Code

sudo snap install code --classic


# ---------------------------------------------------------------------------- #


# ➤ Recommended Extensions

    React Native Tools (official by Microsoft)

    Prettier - Code Formatter

    ESLint

    JavaScript (ES6) code snippets

    Path Intellisense

    Bracket Pair Colorizer


# ---------------------------------------------------------------------------- #




# ---------------------------------------------------------------------------- #
