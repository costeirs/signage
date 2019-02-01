#! /bin/sh
set -e

# install dependencies (quietly-ish)
apt-get update -qq > /dev/null;
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yqq xorg nodm chromium unclutter sox libsox-fmt-all alsa-utils

# enable sound
amixer sset 'Master' 100%

# move kiosk.sh to /root and setup launch
cp kiosk.sh /root/kiosk.sh;
chmod 755 /root/kiosk.sh;
echo "/root/kiosk.sh" > /root/.profile