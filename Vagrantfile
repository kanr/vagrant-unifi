# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "geerlingguy/ubuntu1604"

  config.vm.hostname = "UMC"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8443, host: 8443
  config.vm.network "private_network", ip: "192.168.10.100", vitualbox__inet: "mynetwork"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.name = "UMC"
     vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script.
 config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y software-properties-common python-software-properties
 SHELL

  config.vm.provision "shell", inline: <<-SHELL
      add-apt-repository ppa:openjdk-r/ppa -y
      apt-get update
      echo "\n----- Installing Java 8 ------\n"
      apt-get -y install openjdk-8-jre
    SHELL

   config.vm.provision "shell", inline: <<-SHELL
     echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' \
     | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
     sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
     apt-get update
     apt-get install -y unifi
   SHELL
end
