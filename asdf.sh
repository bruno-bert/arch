#!/bin/bash


#install plugins
/bin/echo -e "\e[1;32mInstalling ASDM Plugins...\e[0m"
asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add dotnet-core



#install versions
/bin/echo -e "\e[1;32mInstalling Versions...\e[0m"
asdf install nodejs 12.19.0
asdf install python 3.7.4
asdf install dotnet-core 3.1.410


#use versions
/bin/echo -e "\e[1;32mUsing versions...\e[0m"
asdf global nodejs 12.19.0
asdf global python 3.7.4
asdf global dotnet-core 3.1.410


/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
