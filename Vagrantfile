require './vagrant-provision-reboot-plugin'

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.vm.post_up_message = ""

  # enable audio drivers on VM settings
  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    if RUBY_PLATFORM =~ /darwin/
      vb.customize ["modifyvm", :id, '--audio', 'coreaudio', '--audiocontroller', 'hda'] # choices: hda sb16 ac97
    elsif RUBY_PLATFORM =~ /mingw|mswin|bccwin|cygwin|emx/
      vb.customize ["modifyvm", :id, '--audio', 'dsound', '--audiocontroller', 'ac97']
    end
  end

  config.vm.provision "copying kiosk script", type: "file", source: "kiosk.sh", destination: "/tmp/kiosk"

  config.vm.provision "installing", type: "shell", inline: <<-SCRIPT
  apt-get update -qq > /dev/null;
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yqq xorg nodm chromium unclutter sox libsox-fmt-all alsa-utils

  amixer sset 'Master' 100%
  
  cp /tmp/kiosk /root/kiosk.sh;
  chmod 755 /root/kiosk.sh;
  echo "/root/kiosk.sh" > /root/.profile
  SCRIPT

  config.vm.provision "rebooting", type: :unix_reboot

end