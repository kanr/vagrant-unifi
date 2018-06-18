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

   unifi.vm.provision "shell", inline: <<-SHELL
      apt-get install -y software-properties-common python-software-properties
   SHELL

    unifi.vm.provision "shell", inline: <<-SHELL
        add-apt-repository ppa:openjdk-r/ppa -y
        apt-get update
        echo "\n----- Installing Java 8 ------\n"
        apt-get -y install openjdk-8-jre
      SHELL

     unifi.vm.provision "shell", inline: <<-SHELL
       echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' \
       | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
       sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
       apt-get update
       apt-get install -y unifi
     SHELL
  end
end
