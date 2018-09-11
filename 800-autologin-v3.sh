#!/bin/bash
set -e
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "THIS SCRIPT WILL ASK YOUR LOGINNAME "
echo "AND WILL USE IT TO ADD YOU TO THE AUTOLOGIN GROUP "
echo "https://wiki.archlinux.org/index.php/LightDM#Enabling_autologin"

##Change your username here
read -p "What is your login? It will be used to add this user to the group autologin : " choice
sudo gpasswd -a $choice autologin

sudo sed -i 's/'#autologin-user='/'autologin-user=$choice'/g' /etc/lightdm/lightdm.conf
sudo sed -i 's/'#autologin-session='/'autologin-session=xfce'/g' /etc/lightdm/lightdm.conf

echo "################################################################"
echo "####  800 PODed You can now autologin - reboot to check   ######"
echo "################################################################"
