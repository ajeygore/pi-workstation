#!/bin/bash
# A sample Bash script, by Ryan
echo "$1 "
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Please provide RPI mount path usually /Volumes/boot"
    exit 1
fi
