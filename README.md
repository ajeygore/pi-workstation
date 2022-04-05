# pi-workstation
Raspberry Pi workstation - Ansible scripts for configuring Raspberry Pi

These scripts allow you to use your Raspberry Pi 4 as developer workstation, when powered with iPad or even with some other machine, this Pi provides network address 10.55.0.1 to itself, and dhcp address to your machine.
You can SSH into or access this machine using 10.55.0.1 - if you powered this machine using USB port on your device

iPad <-- USB C --> Rpi 4

Impatient?

```
#Export your user name
export RPI_USER=rpi_workstation

**sh -c "`curl -fsSL https://raw.githubusercontent.com/ajeygore/pi-workstation/main/configure-pi.sh `"**
```

### Use case?

The simple usecase is that you connect Pi with your iPad, you get full featured working environment, with VIM and customised YADR vim distribution, with many nifty defaults.
This is plain yak shaving, but for me, it worked out very well, I can do simple PoCs on this machine. We setup following things by default

1. YADR
2. Ruby
3. RVM
4. Node
5. Ubuntu Dev Tools

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
