# Deploy Opencart DB Server

This workflow create a linux VM (CentOS 7) from VMware template. Does API call to Inblox to get IP and reserve it. It has a SSH task to wget ansible yaml for for the Opencart Database Installation. 

## SSH Task Details for Opencart DB Server

wget -O /tmp/oc_db.yaml http://172.16.58.2/apps/oc_db.yaml; sudo ansible-playbook -i localhost /tmp/oc_db.yaml

![This is an image](images/opencartworkflow.PNG)

# Deploy Opencart Web Server

This workflow create a linux VM (CentOS 7) from VMware template. Does API call to Inblox to get IP and reserve it. It has a SSH task to wget ansible yaml for for the Opencart Client Installation. Script also will create the initial Database on the Opencart Database Server.      

## SSH Task Details for first Opencart Web Server)eb Server and initialization of Database

wget -O /tmp/oc.yaml http://172.16.58.2/apps/oc.yaml; ansible-playbook -i localhost /tmp/oc.yaml; wget -O /tmp/config.php.sample http://172.16.58.2/apps/config.php.sample; sudo sed -i 's/<OC_DB_SERVER>/{{.global.workflow.input.OpenCartDBServer}}/g' /tmp/config.php.sample; sudo sed -i 's/<OC_SERVER>/{{.global.InfobloxReserveIPv4Address1.output.ipV4Address}}/g' /tmp/config.php.sample; cp /tmp/config.php.sample /var/www/html/opencart/config.php

### SSH Task Details for additonal Opencart Web Servers 

wget -O /tmp/oc.yaml http://172.16.58.2/apps/oc.yaml; ansible-playbook -i localhost /tmp/oc.yaml; wget -O /tmp/config.php.sample http://172.16.58.2/apps/config.php.sample; sudo sed -i 's/<OC_DB_SERVER>/{{.global.workflow.input.OpenCartDBServer}}/g' /tmp/config.php.sample; sudo sed -i 's/<OC_SERVER>/{{.global.InfobloxReserveIPv4Address1.output.ipV4Address}}/g' /tmp/config.php.sample; cp /tmp/config.php.sample /var/www/html/opencart/config.php

![This is an image](images/opencartworkflow.PNG)
