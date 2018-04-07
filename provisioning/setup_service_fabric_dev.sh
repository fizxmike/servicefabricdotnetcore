#!/bin/bash

# if editing this file, use 'vagrant reload --provision' afterwards

# Required Operating System: Ubuntu 16.04 (xenial)

# see here: https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-get-started-linux

## The "magic" script
# sudo curl -s https://raw.githubusercontent.com/Azure/service-fabric-scripts-and-templates/master/scripts/SetupServiceFabric/SetupServiceFabric.sh | sudo bash

## the contents of above were pasted below ##

#
# This script installs and sets up the Service Fabric Runtime and Common SDK.
# It also sets up Azure Service Fabric CLI
#
# Usage: sudo ./SetupServiceFabric.sh
#

if [ "$EUID" -ne 0 ]; then
    echo Please run this script as root or using sudo
    exit
fi

ExitIfError()
{
    if [ $1 != 0 ]; then
        echo "$2" 1>&2
        exit -1
    fi
}

Distribution=`lsb_release -cs`
if [ "xenial" != "$Distribution" ]; then
    echo "Service Fabric is not supported on $Distribution"
    exit -1
fi

#
# Add the service fabric repo and dependents to the sources list.
# Also add the corresponding keys.
#
sh -c 'echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/servicefabric/ xenial main" > /etc/apt/sources.list.d/servicefabric.list'
ExitIfError $?  "Error@$LINENO: Could not add Service Fabric repo to sources."

sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
ExitIfError $?  "Error@$LINENO: Could not add Dotnet repo to sources."

apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
ExitIfError $?  "Error@$LINENO: Failed to add key for Service Fabric repo"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
ExitIfError $?  "Error@$LINENO: Failed to add key for dotnet repo"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
ExitIfError $?  "Error@$LINENO: Failed to add key for docker repo"

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
ExitIfError $?  "Error@$LINENO: Failed to add Docker repo to sources."

apt-get update


#
# Install Service Fabric SDK.
#

echo "servicefabric servicefabric/accepted-eula-ga select true" | debconf-set-selections
echo "servicefabricsdkcommon servicefabricsdkcommon/accepted-eula-ga select true" | debconf-set-selections

apt-get install servicefabricsdkcommon -f -y
ExitIfError $?  "Error@$LINENO: Failed to install Service Fabric SDK"


#
# Setup Azure Service Fabric CLI
#

apt-get install python -f -y
ExitIfError $?  "Error@$LINENO: Failed to install python for sfctl setup."

apt-get install python-pip -f -y
ExitIfError $?  "Error@$LINENO: Failed to install pip for sfctl setup."

pip install sfctl
ExitIfError $?  "Error@$LINENO: sfctl installation failed."

export PATH=$PATH:$HOME/.local/bin/

echo "Successfully completed Service Fabric SDK installation and setup."

## don't forget to setup service fabric cluster ##
sudo /opt/microsoft/sdk/servicefabric/common/clustersetup/devclustersetup.sh
