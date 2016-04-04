# Binary Exploit Testing
A Vagrantfile for testing binary exploits on a virtual server environment

DISCLAIMER: No ports from the virtual machine are forwarded to the host. 

## Getting Started
Place the binaries you want to test in the exploits folder and add them with the desired port to the list.yml file. Be cautious not to specify a port already in use. (Be sure to remove the example entry.) Run vagrant up when you are ready to start up the server.

## Testing
Ansible will configure xinetd and services for you, as well as set a virtual network to test on, with the Vagrant server running on 192.168.30.2 by default (This can be changed in the Vagrantfile.) You can test that everything is working as wanted by attempting to netcat into the server at the designated IP. If you fail to netcat in, check syslog for messages from xinetd.

## Attaching GDB
Running 'vagrant ssh -c "./attachgdb.sh BINARY_NAME"' will attach GDB inside the virtual machine to allow debugging. 
