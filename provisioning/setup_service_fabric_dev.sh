#!/bin/bash

# if editing this file, use 'vagrant reload --provision' afterwards

# Required Operating System: Ubuntu 16.04 (xenial)

# see here: https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-get-started-linux

## The "magic" script
# sudo curl -s https://raw.githubusercontent.com/Azure/service-fabric-scripts-and-templates/master/scripts/SetupServiceFabric/SetupServiceFabric.sh | sudo bash

## Alternatively, it's nice to see what's happening...

# pre-reqs
sudo apt-get install -y curl lsb-release software-properties-common apt-transport-https

# Add the Service Fabric repo to your sources list.
sudo echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/servicefabric/ xenial main" > /etc/apt/sources.list.d/servicefabric.list

# Add the dotnet repo to your sources list.
sudo echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list

# Add docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Add the new Gnu Privacy Guard (GnuPG, or GPG) key to your APT keyring.
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Add the official Docker GPG key to your APT keyring
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# load above repos into cache
sudo apt-get update

# allow for automated EULA acceptance
sudo echo "servicefabric servicefabric/accepted-eula-ga select true" | debconf-set-selections
sudo echo "servicefabricsdkcommon servicefabricsdkcommon/accepted-eula-ga select true" | debconf-set-selections

# finally, the thing(s) we needed: ServiceFabricSDKCommon
sudo apt-get install -y servicefabricsdkcommon servicefabric lttng-modules-dkms