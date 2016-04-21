# Vagrant Personal Exploit Server
A virtual server for testing exploitable executable files. Managed with Vagrant, provisioned with Ansible, and run with Virtualbox, VPES aims to allow an easy and portable way to test exploitable executables on a server environment, without any previous server knowledge.

## How does it work?
The Vagrantfile deploys a new Debian Jessie 64-bit virtual machine to your installation of Virtualbox and sets it up on an private network on your host machine (This allows you to attach netcat or another tool to the IP specified in the Vagrantfile.) Ansible then provisions the server, installing from the packages listed in VPES/provision/setup/vars/main.yml and adding support for 32-bit binaries. It then copies the chosen exploits to /exploits/ on the server and configures xinetd to attach to them on the specified ports.

## Getting Started
Place the executables you want to test in the exploits folder and add them to the list.yml file. Run vagrant up when you are ready to start up the server.

## Testing
Ansible will configure xinetd and services for you, as well as set a virtual network to test on, with the Vagrant server running on 192.168.30.2 by default (This can be changed in the Vagrantfile.) You can test that everything is working as wanted by attempting to netcat into the server at the designated IP. If you fail to netcat in, check syslog for messages from xinetd.

## Attaching GDB
Running 'vagrant ssh -c "./attachgdb.sh BINARY_NAME"' will attach GDB inside the virtual machine to allow debugging. 
