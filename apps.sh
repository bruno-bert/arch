#!/bin/bash
set -e

#install paru AUR helper
/bin/echo -e "\e[1;32mInstalling Paru AUR Helper...\e[0m"
if ! command -v paru &> /dev/null then
 rm -rf ~/tmp
 mkdir ~/tmp
 cd ~/tmp
 git clone https://aur.archlinux.org/paru.git
 cd paru/
 makepkg -si --noconfirm
 cd ~
 rm -rf tmp
else
 /bin/echo -e "\e[1;32mParu AUR Helper is already installed...\e[0m"
fi

#install apps from AUR
/bin/echo -e "\e[1;32mInstalling apps from AUR...\e[0m"
paru -S --noconfirm vala-panel vala-panel-appmenu-common-git vala-panel-appmenu-registrar-git vala-panel-appmenu-xfce-git auto-cpufreq appmenu-gtk-module-git asdf-vm pamac-aur libpamac-aur mongodb-bin-4.0 notes panther-launcher-git postman-bin visual-studio-code-bin timeshift

/bin/echo -e "\e[1;32mInstalling Development Tools from AUR...\e[0m"
paru -S --noconfirm asdf-vm mongodb-bin-4.0 postman-bin visual-studio-code-bin


#install apps from official repos
/bin/echo -e "\e[1;32mInstalling apps from official repositories...\e[0m"
sudo pacman -S --noconfirm yarn arch-audit archiso firefox xarchiver obs-studio vlc plank postgresql-libs

/bin/echo -e "\e[1;32mInstalling Development Tools from official repositories...\e[0m"
sudo pacman -S --noconfirm yarn postgresql-libs

#install docker
/bin/echo -e "\e[1;32mInstalling Docker...\e[0m"
sudo pacman -S --noconfirm docker
groupadd docker
gpasswd -a user docker bruno

#install antivirus
/bin/echo -e "\e[1;32mInstalling Antivirus...\e[0m"
sudo pacman -S --noconfirm clamav clamtk

#virtual box
sudo pacman -S --noconfirm curl virtualbox virtualbox-guest-utils virtualbox-host-modules-arch mesa mesa-libgl

/bin/echo -e "\e[1;32mEnabling services...\e[0m"
sudo systemctl enable --now auto-cpufreq
# sudo systemctl start docker.service
# sudo systemctl enable docker.service

git config --global user.name "Bruno de Paula"
git config --global user.email "bruno.bert.jj@gmail.com"



/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
