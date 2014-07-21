# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Zabbix repo and Puppet installation
  config.vm.provision "shell", inline: "wget http://repo.zabbix.com/zabbix/2.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.2-1+trusty_all.deb"
  config.vm.provision "shell", inline: "dpkg -i zabbix-release_2.2-1+trusty_all.deb"
  config.vm.provision "shell", inline: "aptitude update"
  config.vm.provision "shell", inline: "aptitude -y upgrade"
  config.vm.provision "shell", inline: "aptitude -y install puppet puppet-lint"
  
  # Touch/create hiera.yaml to supress the hiera's warning
  config.vm.provision "shell", inline: "/bin/touch /etc/puppet/hiera.yaml"
  
  # Shell inline provision for puppet module path: this works well
  config.vm.provision "shell", inline: "/bin/ln -s /vagrant /etc/puppet/modules/`cat /vagrant/manifests/init.pp  |grep  \"^class\" |cut -d \" \" -f 2`"
  
  # Puppet provision
  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "tests"
     puppet.manifest_file  = "init.pp"
     puppet.options = "--verbose"
  end

end