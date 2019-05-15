#! /bin/sh
set -e

# install dependencies (quietly-ish)
echo "Installing..."
apt-get update -qq > /dev/null;
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yqq xorg nodm chromium unclutter sox libsox-fmt-all alsa-utils

# enable sound
amixer sset 'Master' 100%

# setup kiosk user
adduser \
   --system \
   --shell /bin/false \
   --gecos 'Kiosk User' \
   --group \
   --disabled-password \
   --home /home/kiosk \
   kiosk
sed -i 's/NODM_USER=root/NODM_USER=kiosk/g' /etc/default/nodm
sed -i 's/#NODM_USER/NODM_USER/g' /etc/default/nodm

# move kiosk.sh and setup launch
mkdir -p /opt/kiosk/
cp kiosk.sh /opt/kiosk/kiosk.sh;
chmod 755 /opt/kiosk/kiosk.sh;
echo "/opt/kiosk/kiosk.sh" > /home/kiosk/.profile
