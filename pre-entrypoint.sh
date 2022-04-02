#!/bin/sh

apt-get install -y apt-transport-https
wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
apt-key add openvpn-repo-pkg-key.pub
wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
apt-get update -y && apt-get install -y openvpn3
