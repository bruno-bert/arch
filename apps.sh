#!/bin/bash
set -e

/bin/echo -e "\e[1;32mType your git name:\e[0m"
read gitname
git config --global user.name "$gitname"

/bin/echo -e "\e[1;32mType your git mail:\e[0m"
read gitmail
git config --global user.email "$gitmail"

git config --global core.editor "nano"



#install paru AUR helper

if ! command -v paru &> /dev/null 
then
 /bin/echo -e "\e[1;32mInstalling Paru AUR Helper...\e[0m"
 rm -rf ~/tmp
 mkdir ~/tmp
 cd ~/tmp
 git clone https://aur.archlinux.org/paru.git
 cd paru/
 makepkg -si --noconfirm
 cd ~
 rm -rf ~/tmp
fi

if ! [[ -f "aurapps_installed" ]]
then
  #install apps from AUR
  /bin/echo -e "\e[1;32mInstalling apps from AUR...\e[0m"
  paru -S --noconfirm vala-panel stacer-bin vala-panel-appmenu-common-git vala-panel-appmenu-registrar-git vala-panel-appmenu-xfce-git auto-cpufreq appmenu-gtk-module-git asdf-vm pamac-aur libpamac-aur mongodb-bin-4.0 notes panther-launcher-git postman-bin visual-studio-code-bin timeshift
  touch aurapps_installed
fi

if ! [[ -f "aurdev_installed" ]]
then
  /bin/echo -e "\e[1;32mInstalling Development Tools from AUR...\e[0m"
  paru -S --noconfirm asdf-vm mongodb-bin-4.0 postman-bin visual-studio-code-bin
  touch aurdev_installed
fi

if ! [[ -f "apps_installed"  ]]
then
 #install apps from official repos
 /bin/echo -e "\e[1;32mInstalling apps from official repositories...\e[0m"
 sudo pacman -S --noconfirm wget yarn arch-audit archiso firefox xarchiver obs-studio vlc plank postgresql-libs
 touch apps_installed  
fi

if ! [[ -f "dev_installed" ]]
then 
  /bin/echo -e "\e[1;32mInstalling Development Tools from official repositories...\e[0m"
  sudo pacman -S --noconfirm yarn postgresql-libs
  touch dev_installed
fi


if ! [[ -f "docker_installed" ]]
then 
 #install docker
 /bin/echo -e "\e[1;32mInstalling Docker...\e[0m"
 sudo pacman -S --noconfirm docker
 sudo usermod -aG docker $USER 
 touch docker_installed
fi

if ! [[ -f "clamav_installed" ]]
then
  #install antivirus
  /bin/echo -e "\e[1;32mInstalling Antivirus...\e[0m"
  sudo pacman -S --noconfirm clamav clamtk
  touch clamav_installed 
fi

if ! [[ -f "virtualbox_installed" ]]
then
  #virtual box
  sudo pacman -S --noconfirm curl virtualbox virtualbox-guest-utils virtualbox-host-modules-arch mesa mesa-libgl
  touch virtualbox_installed 
fi

/bin/echo -e "\e[1;32mEnabling services...\e[0m"
sudo systemctl enable --now auto-cpufreq
# sudo systemctl start docker.service
# sudo systemctl enable docker.service
# sudo systemctl start mongodb
# sudo systemctl enable mongodb




/bin/echo -e "\e[1;32mApps Installation Completed..\e[0m"
#sleep 5
#sudo reboot
