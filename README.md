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



1. If needed, load your keymap

```bash


```


2. Refresh the servers with pacman -Syy
3. Partition the disk
4. Format the partitions
5. Mount the partitions
6. Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git vim intel-ucode (or amd-ucode))
7. Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/FSTAB
8. Chroot in with arch-chroot /mnt
9. Download the git repository with git clone https://gitlab.com/eflinux/arch-basic
10. cd arch-basic
11. chmod +x install-uefi.sh
12. run with ./install-uefi.sh
