# Provision Openshift Cluster on VMware Workflow (no proxy)

This workflow provisons a single node or 3 node Openshift cluster on WMware. The workflow has been tested using static IPs for both node types. For single node you just need one IP address. For 3 node cluster you need 5 IPs. One for each of the nodes and 1 for API and 1 for ingress services. You can use DHCP for 3 node cluster but you still need 2 static IP for the API and igress services. The IPs for nodes and API/igress services must be routable on VMware network.    

The above workflow needs 3 targets. These targets require the Intersight Assist appliance.
 - Powershell Target for Active Directory DNS automation
 - ESXi SSH Target for downloading Redhat Openshift dicovery ISO
 - vCenter Target standard VMware Target for Intersight Virtualization Services  


## Powershell Target Details

Powershell Target with local administrator account for login and password. Use Intersight help instructions for creating the Powershell Target and running script for powershell access.


## ESXi SSH Target
This must be one of your ESXi Servers in the Cluster that has access to the Datastore. Login should be root and password for root.

## vCenter Target
vCenter Target for the vCenter where the VMs are to be provisioned. The is the same target used for the Intersight Virtualization Services to gather inventory information. 


## VMware Templates

You must create VMware Templates for the VM Nodes. The template just contains the VMware configuration and no operating system. The minimum requirement for a Sign Node cluster is a VM with 16 vcpus, 39 Gig Memory and 120 gig disk. For three node cluster I suggest 8 vcpus 16 gig memory and 120 gig disk. Each Templates need the following configuration parameter. 

# Provision Openshift Cluster on VMware Workflow (with proxy)
I am still in the process of combine proxy support with a single workflow. Right now it's a seperate workflow. It currently doesn't have the DNS automation. This could be easlier added by adding the additional child workflow (Create DNS for Openshift Cluster). Also this workflow does not use the ESXi Target. It requires a Linux HTTP Target with Docker to run the container. 

## Link HTTP Target

Command to start container. If you use a different proxy host the change the command.  
docker run -d -p 80:80 —env http_proxy=http://proxy.esl.cisco.com:80 —env https_proxy=http://proxy.esl.cisco.com:80  baelen/iso-host

Claim the ISO Host in Intersight as a HTTP target.
Under Targets click on Claim

    Select the HTTP endpoint and click next
    If you require an Intersight Assist to connect to your apache server select it first.
    Enter the Name, Hostname for your apache server
    Use Port 80
    No Authentication is required.
    No HTTPS needs to be enabled.
    
If you have a different proxy host the you will need to changes the workflow tasks. 

[This is an image](images/CreateClusterTaskInputBody.png)
[This is an image](images/CreateClusterProxySettings.png)
[This is an image](images/CreateInfraEnviromentBody.png)
[This is an image](images/CreateInfraEnvironmentProxy.png)


## VMware Template Configuration 

![This is an image](images/OCP-VMTemplateparam.png)

## Workflow Input Variables

The workflow has many input variables. Most are one time changes that can be updated after importing the workflow. All the one time parameters have default values with no operator override so they will not show up during execution of the workflow unless you change the override option. The variables that have override options are things like IP address, cluster name,etc that are variables that need to be changed with each execution. 
