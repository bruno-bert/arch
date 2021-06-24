# Arch Basic Install Commands-Script

In this repository you will find packages-scripts for the base install of Arch Linux in Xfce desktop environments. 

Modify the packages to your liking, make the script executable with chmod +x scriptname and then run with ./scriptname.

Remember that the first part of the Arch Linux install is manual, that is you will have to partition, format, mount the disk and install the base packages.

1. check your internet connection (YOU NEED THIS TO MOVE ON)

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

1. Refresh the servers with 
```bash
pacman -Syy -y
```

2. load keyboard
```bash
#change br-abnt2 to your keboard layout
loadkeys [br-abnt2]

#you can try some and test to see if it works
#examples
loadkeys us-acentos
loadkeys us
```

2. create and label the disk

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



3. Partition the disk
```bash

#use cfdisk to create the partitions
cfdisk /dev/sda

#create a boot partition (only applicable to UEFI) (need to change type to Linux Boot)
#create the / (root)  in a separated partition (can be 50G)
#create the /home partition (let 2G to the swap partition)
#create the swap partition (need to change type to Linux Swap)

#remember to write changes to all partitions
w and then "yes"
```


4. Format the partitions

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

5. Mount the partitions
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


6. Install the base packages into /mnt 

```bash
pacstrap /mnt base base-devel linux linux-firmware git nano intel-ucode (or amd-ucode))
```

7. Generate the FSTAB file with
```bash
# in /mnt, execute:
genfstab -U -p /mnt >> /mnt/etc/fstab

#confirm fstab is generated accordongly
nano /mnt/etc/fstab
```


8. Chroot in with:
```bash
 arch-chroot /mnt
 ```

9. Download the git repository with 
```bash
git clone https://github.com/bruno-bert/arch.git

```

10. install basics

```bash
#provide access to execute the script
#legacy
chmod +x ./arch/install-mbr.sh
#uefi
chmod +x ./arch/install-uefi.sh


#run the script
#legacy
./arch/install-mbr.sh

#uefi
./arch/install-uefi.sh

``` 

11. reboot
```bash
#leave the chroot
exit


#REMOVE YOUR BOOT MEDIA IN THIS MOMENT!!!!!

#reboot with command:
reboot

``` 

12. first login
```bash
perform the login with root user
user: root
password : password
```

12. install Graphical interface
```bash
#check your internet conenction
sudo systemctl status NetworkManager

#if active (in green), you are online
#if not active, execute:
sudo systemctl start NetworkManager


#provide access to execute the script
chmod +x /arch/xfce.sh

#run the script
/arch/xfce.sh

``` 

