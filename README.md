# Developer Bootstrap

Assuming you are on Ubuntu 16.04, the script below will install VirtualBox and Vegrant, and initialize a developer Virtual Machine with Service Fabric development environment.

```
./developer_boostrap.sh
```
Once the above script completes, you can enter the development environment using the following command: `vagrant ssh`

After a couple minutes, the service fabric portal should come up here: [http://127.0.0.1:19080/Explorer](http://127.0.0.1:19080/Explorer)

If not, you will need to run this command again manually inside the development environment:
```
sudo /opt/microsoft/sdk/servicefabric/common/clustersetup/devclustersetup.sh
```
