#!/bin/sh

apt-get update
apt-get -y upgrade
apt-get -y install puppet augeas-tools
puppet module install acme-ohmyzsh
puppet module install puppetlabs-apt

puppet apply shell.pp
puppet apply workflow.pp
puppet apply java8.pp
