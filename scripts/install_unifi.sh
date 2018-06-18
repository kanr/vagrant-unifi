#!/usr/bin/env bash

apt-get install -y software-properties-common python-software-properties
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
echo "\n----- Installing Java 8 ------\n"
apt-get -y install openjdk-8-jre

echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' \
| sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
apt-get update
apt-get install -y unifi