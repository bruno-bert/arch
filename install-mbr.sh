#!/bin/bash
set -e

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
#sed -i '393s/.//' /etc/locale.gen
cp /etc/locale.gen /etc/locale.gen.backup
echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
echo "archdev" > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 archdev.localdomain archdev" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm
pacman -S --noconfirm grub networkmanager network-manager-applet wpa_supplicant mtools dosfstools linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pulseaudio bash-completion openssh rsync reflector acpi acpi_call tlp bridge-utils dnsmasq vde2 openbsd-netcat ipset firewalld sof-firmware nss-mdns acpid os-prober ntfs-3g

pacman -S --noconfirm xf86-video-intel
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp 
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

id -u bruno &>/dev/null || useradd -m bruno
echo bruno:password | chpasswd
usermod -aG wheel bruno

echo "bruno ALL=(ALL) ALL" >> /etc/sudoers.d/bruno


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




