# Developer Bootstrap

Assuming you are on Ubuntu 16.04, the script below will install VirtualBox and Vegrant, and initialize a developer Virtual Machine with Service Fabric development environment.

```
./developer_boostrap.sh
```
After a couple minutes, the service fabric portal should come up here: [http://127.0.0.1:19080/Explorer](http://127.0.0.1:19080/Explorer)

Once the above script completes, you can enter the development environment using the following command:

```
vagrant ssh
```


If not, you will need to run this command again manually inside the development environment:
```
sudo /opt/microsoft/sdk/servicefabric/common/clustersetup/devclustersetup.sh
```

The (this) root folder is mapped to /vagrant in the vitrual machine.

Try building the examles:
```
cd /vagrant/service-fabric-dotnet-core-getting-started/Services/CounterService/
./build.sh
./install.sh
```

The service should now appear in the Service Fabric portal here: [http://127.0.0.1:19080/Explorer/index.html#/apps](http://127.0.0.1:19080/Explorer/index.html#/apps)