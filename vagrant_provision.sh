
#!/usr/bin/env bash



# -y curl lsb-release software-properties-common apt-transport-https

#for some reason this hangs, so we have to do it step-by-step below
sudo curl -s https://raw.githubusercontent.com/Azure/service-fabric-scripts-and-templates/master/scripts/SetupServiceFabric/SetupServiceFabric.sh | sudo bash

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