#!/bin/sh
/bin/ln -s /vagrant /etc/puppet/modules/`cat /vagrant/manifests/init.pp  |grep  "^class" |cut -d " " -f 2`
