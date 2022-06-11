#!/bin/sh
sudo apt-get update && apt-get install -yqq locales lsb-release software-properties-common ansible wget && apt-get clean
LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
localedef -i en_US -f UTF-8 en_US.UTF-8 && /usr/sbin/update-locale LANG=$LANG
#Get devlopment environment yml
wget https://raw.githubusercontent.com/ajeygore/pi-workstation/main/rpi.yml
sudo RPI_USER=$RPI_USER ansible-playbook rpi.yml 
#Get networking sh yml
wget https://raw.githubusercontent.com/ajeygore/pi-workstation/main/rpi-networking.yml
sudo ansible-playbook rpi-networking.yml 
