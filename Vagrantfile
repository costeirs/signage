require './vagrant-provision-reboot-plugin'

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.vm.post_up_message = ""

  config.vm.provider :virtualbox do |vb|
    vb.gui = true

    # enable audio drivers on VM settings
    if RUBY_PLATFORM =~ /darwin/
      vb.customize ["modifyvm", :id, '--audio', 'coreaudio', '--audiocontroller', 'hda']
    elsif RUBY_PLATFORM =~ /mingw|mswin|bccwin|cygwin|emx/
      vb.customize ["modifyvm", :id, '--audio', 'dsound', '--audiocontroller', 'ac97']
    end
  end

  config.vm.synced_folder "./", "/vagrant"

  config.vm.provision "shell", inline: "cd /vagrant && /bin/sh /vagrant/install.sh"

  config.vm.provision :unix_reboot

end