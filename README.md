# Repo for the ICO Bare Metal Provisioning Workflow

This workflow installs ESXi OS on a Intersight UCS standalone server. The workflow does not use Intersight OS Install feature. The workflow generates the ESXi image with Kickstart file. The workflow requires a Linux VM to store the images and kickstart files. THe images are then installed using vMedia on the UCS server. The requires access to the images with either Https, NFS or CIFS. Example workflow uses CIFS.    

The above workflow uses the following SSH tasks with execute scripts for the following:
 - Update Kickstart File (updateks.sh)
 - Create New ESXi ISO (makeesxi.sh)
 - Wait for OS Install (pingit.sh)  
 Scripts are located in Scripts folder


## Technical Information

Infoblox expose a REST API, named WAPI: all API calls to Infoblox are encrypted using SSL/TLS and authenticated using HTTP basic authentication. Every WAPI Object is r

Note this is a work in progress repository, and as of today, only IPv4 is supported. Soon Ipv6 support will be releases as well.


## Custom resources created in Intersight

The following entity will be created in Intersight after importing the workflow/task:
 - Custom Data Type: 
   - IPv4 CIDR Notation
   - MAC Address in IETF/IEEE format
 - Custom Task: 
   - Infoblox - Get network reference from subnet
   - Infoblox - Get next available IPv4 address
   - Infoblox - Reserve Next Available IPv4 address
   - Infoblox - Delete IPv4 Reservation
 - Custom Workflow:
   - Demo Deploy VM - Advanced Mode
 - Custom Category: 
   - IPAM

**Remember, it is your responsibility to claim Infoblox system as new HTTP Endpoint target in Intersight**. Don't know how to do that: check the Intersight manual [here].(https://intersight.com/help/saas/getting_started/claim_targets)

## Custom Task Technical Details

Find below additional information on the custom task available in this repository.,

![This is an image](images/get-subnet.png)

### Infoblox - Get next available IPv4 address
Get the next available IPv4 address in the given network, by using the internal Infoblox function next_available_ip().
![This is an image](images/get-next-ipv4.png)

### Infoblox - Reserve Next Available IPv4 address
Reserve the next available IPv4 in a network.
![This is an image](images/reserve-ipv4-reservation.png)

> **Note: This custom task support Rollbacks by using Infoblox - Delete IPv4 Reservation**

### Infoblox - Delete IPv4 Reservation
Delete an IPv4 Reservation
![This is an image](images/delete-ipv4-reservation.png)

### Infoblox - Infoblox - Reserve IPv4 Address
Reserve a custom IPv4 Address
![This is an image](images/reserve-custom-ipv4.png)

## Basic Workflow: Get the first available IPv4 from Infoblox from a fiven network.
The below workflow simple combine the two task created before to get the IPv4 from Infoblox.

Youtube video link: https://youtu.be/9G92L1j_4Sc
![This is an image](images/wf_sample_one.png)

## Sample Workflow: Create a VM and assign dynamically an IP released by IPAM

The below workflow simply deploy a new VM, attach a new network, and assign dynamically an IP released by  IPAM. The workflow has been built relying on the above custom task. The workflow make use of one custom task:
 - Infoblox - Get network reference from subnet
 - Infoblox - Get next available IPv4 address
 - Infoblox - Infoblox - Reserve IPv4 Address

Youtube video link: https://youtu.be/KpChPpUJuxo


![This is an image](images/wf_sample_two.png)

