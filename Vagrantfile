# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  # Virtual Machine Image
  config.vm.box = "debian/jessie64"

  # Provision with Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision/vagrant.yml"
  end
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.30.2"

  # Set the Virtual Machine name
  config.vm.provider "virtualbox" do |vb|
    vb.name = "personal_exploit_server"
  end
end
