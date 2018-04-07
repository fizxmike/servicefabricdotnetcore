#!/bin/bash
# see here: https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-get-started-linux

# all this to get latest version of virtualbox (to match virtualbox extension in guest os)
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
# replace xenial below with $(lsb_release -sc) to target your release. I was on elementary os loki, so I had to force xenial.
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list.d/virtualbox.list'

sudo apt-get update

sudo apt remove -y virtualbox virtualbox-5.1

sudo apt-get -y install gcc make linux-headers-$(uname -r) dkms
sudo apt-get -y install virtualbox-5.2

# install vagrant from web
sudo apt-get install gdebi

# wget https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb

# sudo gdebi --n vagrant_2.0.3_x86_64.deb

vagrant init

echo "you are now ready for vagrant up"





# -y curl lsb-release software-properties-common apt-transport-https

# for some reason this hangs, so we have to do it step-by-step below
# sudo curl -s https://raw.githubusercontent.com/Azure/service-fabric-scripts-and-templates/master/scripts/SetupServiceFabric/SetupServiceFabric.sh | sudo bash

# # All because the above script hangs (thanks microsoft)
# # Add the Service Fabric repo to your sources list.
# sudo echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/servicefabric/ xenial main" > /etc/apt/sources.list.d/servicefabric.list

# # Add the dotnet repo to your sources list.
# sudo echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list

# # Add the new Gnu Privacy Guard (GnuPG, or GPG) key to your APT keyring.
# sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# # load above repos into cache
# sudo apt-get update

# # allow for automated EULA acceptance
# sudo echo "servicefabric servicefabric/accepted-eula-ga select true" | debconf-set-selections
# sudo echo "servicefabricsdkcommon servicefabricsdkcommon/accepted-eula-ga select true" | debconf-set-selections

# # finally, the thing we needed
# sudo apt-get install servicefabricsdkcommon servicefabric lttng-modules-dkms