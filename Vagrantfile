# -*- mode: ruby -*
# vi: set ft=ruby :

# Vagrant required version
#Vagrant.require_version ">= 1.6.3"

# Vagrant API
VAGRANTFILE_API_VERSION = "2"

# Vagrant main configuration
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ### VirtualBox Provider configuration
  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 384
    vbox.cpus   = 1
  end

  ### Ubuntu VM Configuration
  ['trusty64'].each do |lsbdistrelease|
    config.vm.define "#{lsbdistrelease}" do |suite|
      suite.vm.box      = "ubuntu/#{lsbdistrelease}"
      suite.vm.hostname = "#{lsbdistrelease}"
      # Comment these lines if your OS isn't the same of the boxes or if the source of these files doesn't exists
      suite.vm.provision :file,  source: File.expand_path('~/.gitconfig'),  destination: '/home/vagrant/.gitconfig'
      suite.vm.provision :file,  source: File.expand_path('~/.bashrc'),     destination: '/home/vagrant/.bashrc'
      suite.vm.provision :file,  source: File.expand_path('~/.vimrc'),      destination: '/home/vagrant/.vimrc'
      suite.vm.provision :shell, path: 'vagrant_ubuntu_bootstrap.sh'
    end
  end
  
  ### CentOS VM Configuration
  ['centos65'].each do |operatingsystemrelease|
    config.vm.define "#{operatingsystemrelease}" do |suite|
      suite.vm.box      = "brodrigues/#{operatingsystemrelease}"
    end
  end

end
