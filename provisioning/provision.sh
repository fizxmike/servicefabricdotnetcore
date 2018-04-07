#!/usr/bin/env bash

$(dirname $0)/setup_dotnet_core_dev.sh
$(dirname $0)/setup_service_fabric_dev.sh

echo "Ready for 'vagrant ssh'!"