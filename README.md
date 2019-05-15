# Kiosk

Debian minimal kiosk with Chromium and audio support.

## Installing on Hardware

1. Install Debian and log in (preferably over `ssh`).
1. `sudo su` to become root.
1. `cd /root` to switch to root's home.
1. `git clone` this project and `cd` into it.
1. `./install.sh`
1. `reboot`

## Configuration

Edit `kiosk.sh` to change the URL.

## Testing

1. You will need to install [Vagrant](https://www.vagrantup.com) and the virtualization platform of your choice e.g. VirtualBox.
1. `vagrant up`.