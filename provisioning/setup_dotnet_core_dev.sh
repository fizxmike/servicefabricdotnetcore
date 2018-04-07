#!/usr/bin/env bash

# if editing this file, use 'vagrant reload --provision' afterwards

# Required Operating System: Ubuntu 16.04 (xenial)

# see here: https://www.microsoft.com/net/learn/get-started/linux/ubuntu16-04

# pre-reqs
sudo apt-get install -y curl lsb-release software-properties-common apt-transport-https

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

sudo apt-get update
sudo apt-get install dotnet-sdk-2.1.103