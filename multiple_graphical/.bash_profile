#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then

  HEIGHT=15
  WIDTH=40
  CHOICE_HEIGHT=4
  BACKTITLE="Select your Graphical Interface"
  TITLE="Graphical Interface"
  MENU="Choose one of the following options:"

  OPTIONS=(1 "XFCE"
           2 "LXQT"
           3 "LXDE"
           4 "I3WM"
           5 "NONE" )

  CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

  clear
  case $CHOICE in
        1)
            exec startx ~/.xinitrc xfce
            ;;
        2)
            exec startx ~/.xinitrc lxqt
            ;;
        3)
            exec startx ~/.xinitrc lxde
           ;;
        4) exec startx ~/.xinitrc i3
        ;;
        

            
  esac


fi
