#!/bin/bash
set -e
sudo timedatectl set-ntp true

sudo reflector --country US --latest 5 --protocol http --protocol https  --sort rate --save /etc/pacman.d/mirrorlist

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo pacman -S --noconfirm xorg xfce4 xfce4-goodies xorg-server xorg-xinit

/bin/echo -e "\e[1;32mXFCE Installation Completed..\e[0m"
#sleep 5
#sudo reboot
