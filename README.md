# Arch Basic Install Commands-Script

In this repository you will find packages-scripts for the base install of Arch Linux in Xfce desktop environments. 
Remember that the first part of the Arch Linux install is manual, that is you will have to partition, format, mount the disk and install the base packages.

1. Check your internet connection (YOU NEED THIS TO MOVE ON)
**Note**: If you are connected to network though cable or using a virtual machine, you will be OK with internet connection by standard

To confirm this:

```
ip addr show

# must return the ping
ping google.com
```

2. If you don't have cable connection, this is how you connect through wifi:

```bash
# open the iwctl propmt
iwctl

# list the wlan devices  (usually will be **wlan0**)
station list

# get your wlanid  to be replaced in following commands

#list the available newtorks
station [wlanid] get-networks

# replace wlan id and networkname
# if your connection name has spaces, you need to use the "connection_name" between the quotes
station list [wlanid] connect ["network_name"]

# Ctrl + C to leave the iwctl command prompt
```

3. Refresh the packages
```bash
pacman -Syy -y
```

4. load keyboard
```bash
#change br-abnt2 to your keboard layout
loadkeys [br-abnt2]

#you can try some and test to see if it works
#examples
loadkeys us-acentos
loadkeys us
```

5. Create and label the disk

```bash
# list disks
fdisk -l 

#replace by your disk path
fdisk [/dev/sda]

#press m for help
m

#create a new label
#press "o" for legacy (create a new empty DOS partition table)
#press "g" for UEFI (create a new empty GPT partition table)
#in our case, it will be legacy
o

#press w to save the change
w
```



6. Partition the disk
```bash

#use cfdisk to create the partitions
cfdisk /dev/sda

#create a boot partition (only applicable to UEFI) (need to change type to Linux Boot)
#create the / (root)  in a separated partition (can be 50G)
#create the /home partition (let 2G to the swap partition)
#create the swap partition (need to change type to Linux Swap)

#remember to write changes (repeat to all partitions)
Select the option "Write". press Enter and type "yes", Enter Again
```


7. Format the partitions

```bash
#confirm the partitions names
fdisk -l /dev/sda

#format boot partition (only to UEFI)
# change /dev/sdax to the name of yout boot partition (listed in previous command)
mkfs.fat -F32 [/dev/sdax]

#format / (root) partition (change [/dev/sdax] to the name of your root partition) (usually in linux, use ext4 type)
mkfs.ext4 [/dev/sdax]

#format /home partition (change [/dev/sdax] to the name of your home partition) (usually in linux, use ext4 type)
mkfs.ext4 [/dev/sdax]

#format swap partition (change [/dev/sdax] to the name of your swap partition) (usually in linux, use ext4 type)
mkswap [/dev/sdax]
```

8. Mount the partitions
```bash

#change [/dev/sdax] to root (/) partition name 
mount [/dev/sdax] /mnt

#create the boot and home directories inside root
cd /mnt 
mkdir home
mkdir boot

#only to uefi
mkdir /boot/efi

#change [/dev/sdax] to boot partition name 
#legacy
mount [/dev/sdax] /mnt/boot

#efi
mount ]/dev/sdax] /mnt/boot/efi

#change [/dev/sdax] to home partition name 
mount [/dev/sdax] /mnt/home

#change [/dev/sdax] to swap partition name 
swapon [/dev/sdax]

```


9. Install the base packages into /mnt 

```bash
pacstrap /mnt base base-devel linux linux-firmware git nano intel-ucode (or amd-ucode))
```

10. Generate the FSTAB file with
```bash
# in /mnt, execute:
genfstab -U -p /mnt >> /mnt/etc/fstab

#confirm fstab is generated accordongly
nano /mnt/etc/fstab
```


11. Chroot in with:
```bash
 arch-chroot /mnt
 ```

12. Download the git repository with 
```bash
git clone https://github.com/bruno-bert/arch.git

```

13. Install Basics

```bash
#provide access to execute the scripts
#legacy
chmod +x ./arch/install-mbr.sh
#uefi
chmod +x ./arch/install-uefi.sh
chmod +x ./arch/xfce.sh
chmod +x ./arch/apps.sh
chmod +x ./arch/config.sh
chmod +x ./arch/asdf.sh

#run the script
#legacy
./arch/install-mbr.sh

#uefi
./arch/install-uefi.sh

``` 

14. Shutdown and Remove Boot Media

```bash
#leave the chroot
exit

#umount all partitions
umount -a

#shutdown with command:
shutdown now

#REMOVE YOUR BOOT MEDIA IN THIS MOMENT!!!!!

#Restart your computer

``` 

15. First Login
```bash
perform the login with root user
user: root
password : password
```

16. install Graphical interface
```bash
#check your internet conenction
sudo systemctl status NetworkManager

#if active (in green), you are online
#if not active, execute:
sudo systemctl start NetworkManager

#run the script
/arch/xfce.sh

#reboot again
reboot
``` 

17. Install Apps
```
#change [USER] to your username
su [USER]

#execute script
/arch/apps.sh
```

18. Add dot files and Configure Look and Feel (themes, icons, etc...)
```
#change [USER] to your username
su [USER]

#execute script
/arch/config.sh
```

19. Install Development SDKs
```
#change [USER] to your username
su [USER]

#execute script
/arch/asdf.sh
```
