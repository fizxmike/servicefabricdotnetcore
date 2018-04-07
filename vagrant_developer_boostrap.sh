#!/bin/bash

# I was on Elementary OS (loki), so I had to force xenial.
release=xenial

# uncomment next line if you are not on xenial
# release=$(lsb_release -sc)

# all this to get latest version of virtualbox (to match virtualbox extension in guest os)
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $release contrib" >> /etc/apt/sources.list.d/virtualbox.list'

sudo apt-get update

sudo apt remove -y virtualbox virtualbox-5.1

sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms
sudo apt-get -y install virtualbox-5.2

# download vagrant from web
wget https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb

# install vagrant with gdebi (--n is for non-interactive install)
sudo apt-get install gdebi
sudo gdebi --n vagrant_2.0.3_x86_64.deb
rm vagrant_2.0.3_x86_64.deb

echo "you are now ready for 'vagrant up' then 'vagrant ssh'"