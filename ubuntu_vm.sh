#!/bin/bash

clear
echo "This script hopes to automate many of the often forgotten 
tasks required to setup a Ubuntu 14.04 Default LAMP Server in 
VirtualBox under MAC OSX. It should be executed immediately after 
installing Ubuntu Server with the 'OpenSSH server' and 'LAMP server' 
packages selected from the Software Selection dialog. If you set a 
root password for mysql during installation, you may skip the 
MySQL Secure Installation. 

You can run VirtualBox VMs in the background: 
    
    bash$ /usr/bin/VBoxHeadless --startvm [VM_NAME]

I AM NOT RESPONSIBLE IF THIS SCRIPT BREAKS YOUR SERVER.
"
read -p "Name this server (must be lowercase): " host_name
read -p "Your full name: " full_name
read -p "Your email address: " email_address

clear
echo "The VirtualBox Shared Folder is set in the VM settings 
from the 'Shared Folders' tab.

Enter the 'Name' value for the shared folder:"
read share_name

clear
echo "Do you want to run MySQL Secure Installation? [y/n]"
read mysql

clear
echo "Do you want to enable phpMyAdmin? [y/n]"
read phpmyadmin

sudo apt-get update

clear
echo "Installing Git"
sudo apt-get install git -y
git config --global user.email $email_address
git config --global user.name $full_name
source config/git.sh

clear
echo "Installing and enabling multi-cast"
sudo apt-get install avahi-daemon -y
sudo update-rc.d avahi-daemon defaults

clear
echo "Installing VirtualBox Guest Additions"
wget http://download.virtualbox.org/virtualbox/4.3.26/VBoxGuestAdditions_4.3.8.iso
sudo apt-get install dkms build-essential virtualbox-guest-dkms linux-headers-$(uname -r) -y
sudo /mnt/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_4.3.26.iso

clear
echo "Mounting VirtualBox Shared Folder at /home/$USER/$share_name 
and linking to Apache via /var/www/html/$share_name"
mkdir /home/$USER/$share_name
echo 'vboxsf' | sudo tee --append /etc/initramfs-tools/modules # to be sure vbox share is loaded before fstab is read
sudo update-initramfs -u -k all
echo "$share_name /home/$USER/$share_name vboxsf defaults,_netdev,uid=33,gid=33 0 0" | sudo tee --append /etc/fstab
sudo ln -s /home/$USER/$share_name /var/www/html/$share_name
sudo touch /etc/apache2/sites-available/$host_name.conf
echo "<VirtualHost *:80>
	ServerName $host_name.local
	ServerAdmin $email_address
	DocumentRoot /var/www/html/$share_name
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	<Directory /var/www/html/$share_name>
		allow from all
		order allow,deny
		AllowOverride All
	</Directory>
</VirtualHost>" | sudo tee --append /etc/apache2/sites-available/$host_name.conf
sudo mount -a

sudo a2ensite $host_name.conf
sudo a2enmod rewrite

if [ $mysql = y ]
	then sudo mysql_secure_installation
fi

if [ $phpmyadmin = y ]
	then echo "When asked, select [apache2] for the automated phpMyAdmin setup"
	read void
	sudo apt-get install phpmyadmin -y
fi

clear
echo "Setting hostname"
echo "127.0.0.1       localhost       $host_name
# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes\nff02::2 ip6-allrouters" | sudo tee /etc/hosts
echo "$host_name" | sudo tee /etc/hostname

clear
echo "Setup is nearly complete. After rebooting, your server should 
be accessible at '$host_name.local'. If you do not see the directory
you are expecting, you might need to run sudo mount -a to read from
the /etc/fstab file.
"
if [ $phpmyadmin = y ]
	then echo "You can administer your database(s) at '$host_name.local/phpmyadmin'.
	"
fi
echo "Press ENTER now to reboot."
read void

sudo reboot
