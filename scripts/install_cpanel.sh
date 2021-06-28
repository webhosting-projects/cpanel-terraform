#!/bin/bash

#cpanel
cd /home 
wget –N http://httpupdate.cpanel.net/latest
chmod +x latest 
sh latest

#Softaculous
wget -N http://files.softaculous.com/install.sh
chmod 755 install.sh
./install.sh
