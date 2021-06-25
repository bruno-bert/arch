#!/bin/bash
set -e

/bin/echo -e "\e[1;32mCopying dot files..\e[0m"
cp /dotfiles/*.* ~

/bin/echo -e "\e[1;32mCopying themes..\e[0m"
cp /.themes ~

/bin/echo -e "\e[1;32mCopying icons..\e[0m"
cp /.icons ~

/bin/echo -e "\e[1;32mCopying local..\e[0m"
cp /.local ~

/bin/echo -e "\e[1;32mCopying config..\e[0m"
cp /.config ~

/bin/echo -e "\e[1;32mCopying backgrounds..\e[0m"
cp /backgrounds/archlinux /usr/share/backgrounds~


/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
