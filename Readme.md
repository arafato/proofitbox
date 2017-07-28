# Proofitbox on Azure
ARM Template to deploy the proofitbox environemnt on Azure. It is divided into four subnets within a VNET of range 10.0.0.0/16:
- Bastion (10.0.4.0/24): Contains the Jumphost VM which is the only VM with a public IP and lets you connect to every VM within the VNET
- Frontend (10.0.1.0/24): Contains a Virtual Machine Scaling Set (minimum 2 VMs) with according scaling rules, and a public load balancer. This is where the JBoss hosted proofitbox app runs.
- Database (10.0.2.0/24): Contains the single instance MS SQL 2016 database with a 1024GB data disk attached to it. This should be replaced with a Azure Managed SQL instance. 
- NAM (10.0.3.0/24): Contains 2 VMs fronted by a internal loadbalancer.

See [https://github.com/arafato/proofitbox/blob/master/nsg.json](https://github.com/arafato/proofitbox/blob/master/nsg.json) for details about the individual Network Security Groups assigned to each subnet.

## Deployment
To facilitate automated deployment with the command line please use [https://github.com/arafato/proofitbox/blob/master/deploy.bat](https://github.com/arafato/proofitbox/blob/master/deploy.bat) which uses the [Azure CLI 2.0](https://docs.microsoft.com/cli/azure/install-azure-cli). It expects three arguments:
```
$ deploy.bat <default username> <default password> <project prefix>
```
where _default username and password_ specify the standard values to be used for every VM. Adapt ARM Template accordingly for changes to this behavior. _project prefix_ is appended to every resource name and DNS name.
If you want to deploy into a different Azure environment such as Azure Germany, please re-configure your CLI accordingly. See [https://docs.microsoft.com/azure/germany/germany-get-started-connect-with-cli](https://docs.microsoft.com/azure/germany/germany-get-started-connect-with-cli) for details.

Alternatively, click on below button to deploy the entire environment to the Azure Global Cloud.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Farafato%2Fproofitbox%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

