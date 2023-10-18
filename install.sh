#! /bin/bash

printInfo () {
    echo "[+] $1..."
    sleep 0.5
}

printInfo "Updating package lists"
sudo apt update
sudo apt upgrade -y

printInfo "Installing LimeOS dependencies"
sudo apt install -y sway waybar wofi foot thunar grimshot network-manager-gnome

printInfo "Installing display manager"
[ -s /etc/X11/default-display-manager ] || sudo apt install slim -y

printInfo "Installing configs"
rm /usr/share/wayland-sessions/sway.desktop
mkdir /usr/share/wayland-sessions
cp Configs/Desktop/* /usr/share/wayland-sessions/
mkdir ~/.config/foot
cp Configs/Foot/* ~/.config/foot/
mkdir ~/.config/sway
cp Configs/Sway/* ~/.config/sway/
mkdir ~/.config/waybar
cp Configs/Waybar/* ~/.config/waybar/
mkdir ~/.config/wofi
cp Configs/Wofi/* ~/.config/wofi/
mkdir /usr/share/backgrounds/sway/
cp Wallpapers/* /usr/share/backgrounds/sway/
sudo mkdir -p "/usr/local/share/fonts/"
sudo cp Fonts/* "/usr/local/share/fonts/"
sudo fc-cache -fv

printInfo "Installed!"
printInfo "Restarting..."

sudo reboot now
