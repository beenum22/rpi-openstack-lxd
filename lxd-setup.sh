#!bin/bash

#We need to update everything

sudo apt-get update
sudo apt-get upgrade

#Next we need to setup LXD and remember it has to be the latest stable version, sometimes our OS mistakenly installs an older version or because LXC is outdated.

sudo apt-get remove lxc

#Update the requirements of LXD

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ubuntu-lxc/lxd-git-master
sudo apt-get install golang lxc lxc-dev mercurial git pkg-config protobuf-compiler golang-goprotobuf-dev xz-utils tar acl make
sudo apt-get install lxd

#LXD team is shifting from lxcbr0 to lxdbr0 completely. Sometimes the default bridge is still lxcbr0 and we need to change it to lxdbr0

sudo dpkg-reconfigure -p medium lxd

#ONE ADDITIONALLY FOR ARM BASED DEVICES
#lxc profile set default raw.lxc lxc.seccomp=
#Because no seccomp policy defined for ARM I guess

echo "Hopefully Everything went well and you're ready to use LXD now"
