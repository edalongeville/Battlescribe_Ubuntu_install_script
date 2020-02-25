#!/bin/bash
# This script installs Battlescribe on Ubuntu 18.04

FILE="BattleScribe_2.03.12_Multi.zip"
ICON_WEB="battlescribe_icon_128.png"
ICON="battlescribe.png"
DESKFILE="battlescribe.desktop"
INSTALL_DIR="/usr/bin/battlescribe"
ICONS_DIR="/usr/share/icons/hicolor"
DESKFILES_DIR="/usr/share/applications"

# Install Java
sudo apt install openjdk-8-jdk openjdk-8-jre

# Download Battlescribe
wget http://battlescribe.net/files/$FILE

# Download Icon
wget https://www.battlescribe.net/images/icon/$ICON_WEB

# Extract Battlescribe to install dir
sudo mkdir $INSTALL_DIR
sudo unzip $FILE -d $INSTALL_DIR

# Create run script
echo "#!/bin/bash" | sudo tee -a $INSTALL_DIR/Battlescribe.sh  >/dev/null
echo "java -jar $INSTALL_DIR/RosterEditor.jar" | sudo tee -a $INSTALL_DIR/Battlescribe.sh  >/dev/null

# Make file executable
sudo chmod +x $INSTALL_DIR/Battlescribe.sh

# Deploy icons
## 32x32
sudo convert -resize 32x32 $ICON_WEB $ICONS_DIR/32x32/apps/$ICON
## 48x48
sudo convert -resize 48x48 $ICON_WEB $ICONS_DIR/48x48/apps/$ICON
## 64x64
sudo convert -resize 64x64 $ICON_WEB $ICONS_DIR/64x64/apps/$ICON
## 128x128
sudo cp $ICON_WEB $ICONS_DIR/128x128/apps/$ICON

# Deploy desktop file (Gnome menu entry)
sudo cp $DESKFILE $DESKFILES_DIR/$DESKFILE

# Cleanup
rm $FILE
rm $ICON_WEB
