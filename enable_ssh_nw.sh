#!/bin/bash
echo "$1 "
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Please provide RPI mount path usually /Volumes/boot"
    exit 1
fi

#enabling ssh
echo "Enabling SSH, creating file ssh"
touch $1/ssh


