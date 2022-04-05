
#!/bin/sh
apt-get update && apt-get install -yqq locales lsb-release software-properties-common ansible wget && apt-get clean  
LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
localedef -i en_US -f UTF-8 en_US.UTF-8 && /usr/sbin/update-locale LANG=$LANG
#Get devlopment environment yml
ansible-playbook rpi.yml 
#Get networking sh yml
ansible-playbook rpi-networking.yml 
