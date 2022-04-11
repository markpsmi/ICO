# Repo for the ICO Bare Metal Provisioning Workflow

This workflow installs ESXi OS on a Intersight UCS standalone server. The workflow does not use Intersight OS Install feature. The workflow generates the ESXi image with Kickstart file. The workflow requires a Linux VM to store the images and kickstart files. THe images are then installed using vMedia on the UCS server. The requires access to the images with either Https, NFS or CIFS. Example workflow uses CIFS.    

The above workflow uses the following SSH tasks with execute scripts for the following:
 - Update Kickstart File (updateks.sh)
 - Create New ESXi ISO (makeesxi.sh)
 - Wait for OS Install (pingit.sh)  
 Scripts are located in Scripts folder


## Technical Information



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

## Script Details

### updateks.sh
Get the next available IPv4 address in the given network, by using the internal Infoblox function next_available_ip().
![This is an image](images/updateks.png)

### makesesxi.sh



> **Note: This custom task support Rollbacks by using Infoblox - Delete IPv4 Reservation**

### pingit.sh









