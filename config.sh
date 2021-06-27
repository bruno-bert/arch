#!/bin/bash
set -e

/bin/echo -e "\e[1;32mCopying dot files..\e[0m"
cp -a /arch/dotfiles/. ~/

/bin/echo -e "\e[1;32mCopying themes..\e[0m"
cp -a /arch/.themes ~/

/bin/echo -e "\e[1;32mCopying icons..\e[0m"
cp -a /arch/.icons ~/

/bin/echo -e "\e[1;32mCopying local..\e[0m"
cp -a /arch/.local ~/

/bin/echo -e "\e[1;32mCopying config..\e[0m"
cp -a /arch/.config ~/

/bin/echo -e "\e[1;32mCopying backgrounds..\e[0m"
sudo cp -a /arch/backgrounds/archlinux /usr/share/backgrounds/

#/bin/echo -e "\e[1;32mCopying firefox bookmarks..\e[0m"
#sudo cp -a /arch/places.sqlite ~/.mozilla/firefox/*default-release/
#sudo cp -a /arch/favicons.sqlite ~/.mozilla/firefox/*default-release/


/bin/echo -e "\e[1;32mThemming Completed..\e[0m"
#sleep 5
#sudo reboot
