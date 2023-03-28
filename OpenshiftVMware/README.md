# Provision Openshift Cluster on VMware Workflow

This workflow provisoning a single node or 3 node Openshift cluster on WMware. The workflow has been tested using static IPs for both node types. For single node you just need one IP address. For 3 node cluster you need 5 IPs. One for each node and 1 for API and 1 for ingress. The IPs for nodes must be routable on VMware network for the VMs.    

The above workflow needs 3 targets. These targets require the Intersight Assist appliance to access.
 - Powershell Target for Active Directory DNS automation
 - ESXi SSH Target for downloading Redhat Openshift dicovery ISO
 - vCenter Target standard VMware Target for Intersight Virtualization Services  


## Powershell Target Details

Powershell Target with local administrator account for login and password. Use Intersight help instructions for creating the Powershell Target and running script for powershell access.


## ESXi SSH Target
This must be one of your ESXi Servers in the Cluster that has access to the Datastore






### pingit.sh
Script runs and waits for OS to be installed by checking the reachablity of ESXI server IP address

SSH Task Command /tmp/pingit.sh {{.global.workflow.input.IpAddress}}

![This is an image](images/pingit.PNG)


## Workflow Image

![This is an image](images/workflow.PNG)
