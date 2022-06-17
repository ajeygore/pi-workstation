
#!/bin/sh
apt-get update && apt-get install -yqq locales lsb-release software-properties-common ansible && apt-get clean  
LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
localedef -i en_US -f UTF-8 en_US.UTF-8 && /usr/sbin/update-locale LANG=$LANG
ansible-playbook rpi.yml 
