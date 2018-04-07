#!/usr/bin/env bash

$(dirname $0)/setup_dotnet_core_dev.sh

$(dirname $0)/setup_service_fabric_dev.sh

## setup service fabric development cluster ##
sudo /opt/microsoft/sdk/servicefabric/common/clustersetup/devclustersetup.sh

echo "Ready for 'vagrant ssh'!"