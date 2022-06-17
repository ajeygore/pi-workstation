# pi-workstation
Raspberry Pi workstation - Ansible scripts for configuring Raspberry Pi

These scripts allow you to use your Raspberry Pi 4 as developer workstation, when powered with iPad or even with some other machine, this Pi provides network address 10.55.0.1 to itself, and dhcp address to your machine.
You can SSH into or access this machine using 10.55.0.1 - if you powered this machine using USB port on your device

So if you want to carry a portable development environment, you can use this to get going.

Three steps process
* format sd card
* enable ssh
* ssh in raspberry pi and then run configuration script


### Setup WiFi and enable ssh (If you are not using rpi-imager)

You need to touch ssh file on boot volume and create a wpa supplicant file. Following file will do that for you

Download enable_ssh_nw.sh

```
wget  https://raw.githubusercontent.com/ajeygore/pi-workstation/main/enable_ssh_nw.sh
```

then execute file in your laptop with SD card

```
./enable_ssh_nw.sh <volume name usually /Volumes/boot> <WiFi SSID> <WiFi password>
```

Insert the SD card in Pi, wait for it to bootup, usually you should be able to access it using hostname raspberry pi, then ssh into the box, and follow the next steps


Impatient, and you are RPi 4

```
#Export your user name
export RPI_USER=rpi_workstation
```

Then copy and paste following command to setup development environment and networking for Raspberry Pi 4

```
sudo RPI_USER=$RPI_USER sh -c "`curl -fsSL https://raw.githubusercontent.com/ajeygore/pi-workstation/main/configure-pi.sh `"
```

If you are on RPi 3/3b please use following command, it does not setup networking

```
sudo RPI_USER=$RPI_USER sh -c "`curl -fsSL https://raw.githubusercontent.com/ajeygore/pi-workstation/main/rpi-devel-env.sh `"
```

### Post installation

You need to setup two things manually, one is YADR (we really love this repo) working environment, and a ruby version manager

### Use case?

The simple usecase is that you connect Pi with your iPad, you get full featured working environment, with VIM and customised YADR vim distribution, with many nifty defaults.
This is plain yak shaving, but for me, it worked out very well, I can do simple PoCs on this machine. We setup following things by default

1. Ruby
2. Node
3. Ubuntu Dev Tools


### This is a very opinionated repository

We use "ansible" as configuration management tool. Before you get started on this, 

### How to use this
* get plain ubuntu dev headless distro, or raspbian headless distribution
* add an empty file name ssh to /boot and also create a file named wpa_supplicant in /boot
```
country=<<two letter country code such as IN, SG, UK, ID>>
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="<<Your SSID"
    psk="SSID password"
}
```
* plug the pi in your USB port, and power it up
* login to pi, clone this repo and run appropriate sh for the setup, devel only sets up the dev env, while networking, configures pi 4's USB C port as P2P network interface.


#### Credits
* https://www.linux-projects.org/uv4l/tutorials/play-retropie-in-browser/ (for uv4l and retropie setup)
