# Repo for the ICO Bare Metal Provisioning Workflow

This workflow installs ESXi OS on a Intersight UCS standalone server. The workflow does not use Intersight OS Install feature. The workflow generates the ESXi image with Kickstart file. The workflow requires a Linux VM to store the images and kickstart files. THe images are then installed using vMedia on the UCS server. The requires access to the images with either Https, NFS or CIFS. Example workflow uses CIFS.    

The above workflow uses the following SSH tasks with execute scripts for the following:
 - Update Kickstart File (updateks.sh)
 - Create New ESXi ISO (makeesxi.sh)
 - Wait for OS Install (pingit.sh)  
 Scripts are located in Scripts folder


## Technical Information



## Custom resources created in Intersight





## Script Details

### updateks.sh

![This is an image](/tree/main/images/updateks.png)

### makesesxi.sh



> **Note: This custom task support Rollbacks by using Infoblox - Delete IPv4 Reservation**

### pingit.sh









