# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  
  config.vm.define "unifi" do |unifi|
    unifi.vm.box = "geerlingguy/ubuntu1604"

    unifi.vm.hostname = "UMC"
    unifi.vm.network "forwarded_port", guest: 8080, host: 8080
    unifi.vm.network "forwarded_port", guest: 8443, host: 8443
    unifi.vm.network "private_network", ip: "192.168.99.10", vitualbox__inet: "vboxnet0"
    #unifi.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"

    unifi.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.name = "UMC"
       vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    unifi.vm.provision "file", source: "scripts", destination: "/home/vagrant/scripts"
    unifi.vm.provision "shell", path: "scripts/install_unifi.sh"

  end
end
