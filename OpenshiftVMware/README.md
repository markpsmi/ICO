# Provision Openshift Cluster on VMware Workflow

This workflow provisoning a single node or 3 node Openshift cluster on WMware. The workflow has been tested using static IPs for both node types. For single node you just need one IP address. For 3 node cluster you need 5 IPs. One for each node and 1 for API and 1 for ingress. The IPs for nodes must be routable on VMware network for the VMs.    

The above workflow needs 3 targets. These targets require the Intersight Assist appliance to access.
 - Powershell Target for Active Directory DNS automation
 - ESXi SSH Target for downloading Redhat Openshift dicovery ISO
 - Wait for OS Install (pingit.sh)  
 > **Note: Scripts are located in scripts folder in repo**


## Script Details

### updateks.sh
Update Kickstart file. Requires existing kickstart file on linux image server. Script can be modified to pass additional workflow parameters.

SSH Task Command  /tmp/updateks.sh {{.global.workflow.input.HosteName}} {{.global.workflow.input.IpAddress}}

![This is an image](images/updateks.PNG)


### makesesxi.sh
Create new ESXi ISO. Requires ESXi ISO on image server. Script builds new ISO with Kickstart for vmedia install.

SSH Task Commmand /tmp/makeESXi.sh {{.global.workflow.input.HostName}}

![This is an image](images/makeESXi.PNG)


### pingit.sh
Script runs and waits for OS to be installed by checking the reachablity of ESXI server IP address

SSH Task Command /tmp/pingit.sh {{.global.workflow.input.IpAddress}}

![This is an image](images/pingit.PNG)


## Workflow Image

![This is an image](images/workflow.PNG)
