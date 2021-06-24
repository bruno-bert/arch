#!/bin/bash
set -e
sudo timedatectl set-ntp true

#sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload


#git clone https://aur.archlinux.org/paru.git
#cd paru/
#makepkg -si --noconfirm

#paru -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq

sudo pacman -S --noconfirm xorg xfce4 xfce4-goodies xorg-server xorg-xinit

#if on virtual box
#pacman -S virtualbox-guest-utils virtualbox-guest-modules-arch mesa mesa-libgl

#this script will not isntall any display manager (the login will be made on tty console terminal -> lightweight!)
#sudo systemctl enable lightdm

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
