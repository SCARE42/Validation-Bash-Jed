#!/bin/bash
echo -e "selectione une adresse IP"
read adresseIP
echo -e "nommer le dossier a synchroniser"
read dossier

touch Vagrantfile
mkdir $data

echo "# -- mode: ruby --
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
config.vm.box = 'ubuntu/xenial64'
config.vm.network 'private_network', ip: '$IP'
config.vm.synced_folder './$data', '/var/www/html'
end
" >> Vagrantfile

vagrant up
vagrant ssh
sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install php7.0 -y
sudo rm /var/www/html/index.html;

