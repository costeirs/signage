#! /bin/sh
set -e

# power settings
xscreensaver -no-splash &   # no splash
xset s off -dpms &          # disable dpms and screen saver blanking
xset s noblank &            # disable blanking video device
unclutter -idle 0.5 &       # hide cursor when idle


# chromium kiosk
# disable _everything_

CHROMIUM_TEMP=~/tmp/chromium
rm -Rf ~/.config/chromium/
rm -Rf $CHROMIUM_TEMP
mkdir -p $CHROMIUM_TEMP

while true; do

chromium \
    --no-sandbox \
    --disable \
    --disable-app-info-dialog-mac \
    --disable-app-window-cycling \
    --disable-bookmark-reordering \
    --disable-boot-animation \
    --disable-breakpad \
    --disable-bundled-ppapi-flash \
    --disable-cloud-import \
    --disable-component-cloud-policy \
    --disable-component-extensions-with-background-pages \
    --disable-contextual-search \
    --disable-d3d11 \
    --disable-datasaver-prompt \
    --disable-demo-mode \
    --disable-device-disabling \
    --disable-device-discovery-notifications \
    --disable-default-apps \
    --disable-dinosaur-easter-egg \
    --disable-drive-search-in-app-launcher \
    --disable-eol-notification \
    --disable-extensions \
    --disable-file-manager-touch-mode \
    --disable-infobars \
    --disable-ios-physical-web \
    --disable-logging \
    --disable-md-oobe \
    --disable-new-channel-switcher-ui \
    --disable-ntp-most-likely-favicons-from-server \
    --disable-ntp-popular-sites \
    --disable-pinch \
    --disable-proximity-auth-bluetooth-low-energy-discovery \
    --disable-pull-to-refresh-effect \
    --disable-session-crashed-bubble \
    --disable-signin-promo \
    --disable-suggestions-service \
    --disable-suggestions-ui \
    --disable-save-password-bubble \
    --disable-sync \
    --disable-translate \
    --disable-voice-input \
    --disable-wake-on-wifi \
    --noerrdialogs \
    --disk-cache-dir="$CHROMIUM_TEMP/cache/" \
    --user-data-dir="$CHROMIUM_TEMP/user_data/" \
    --start-fullscreen \
    --window-position=0,0 \
    --window-size=7000,7000 \
    --kiosk \
    --incognito \
    "https://www.google.com/"

done
