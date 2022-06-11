#!/bin/bash

if [ $1 == "--help" ]; then
    aecho "Usage: pi_lan_access.sh \"<boot volume>\" \"<wifi name>\" \"<wifi password>\""
    exit 1
fi

boot_volume=$1
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Please enter sd card boot mount point usually /Volumes/boot"
    read boot_volume
    exit 1
fi


#enabling ssh

echo "Enabling SSH, creating file ssh"
touch "$boot_volume/ssh"

wifi_ssid=$2
wifi_password=$3

if [ $# -eq 1 ]; then
    echo ""
    echo "Enabling wireless access"
    echo "========================"
    echo ""
    echo "Please provide WiFi name:"
    read wifi_ssid
    echo "Please provide WiFi password"
    read wifi_password
fi

wf="$boot_volume/wpa_supplicant.conf"

echo "Writing wpa_supplicant.info to $boot_volume with WiFi: $wifi_ssid and Passwird: $wifi_password "
echo "country=us" > $wf
echo "update_config=1" >> $wf 
echo "ctrl_interface=/var/run/wpa_supplicant" >> $wf
echo "network={" >> $wf
echo " scan_ssid=1" >> $wf
echo " ssid=\"$wifi_ssid\"" >> $wf
echo " psk=\"$wifi_password\"" >> $wf
echo "}" >> $wf

