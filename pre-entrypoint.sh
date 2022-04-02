#!/bin/sh

apt-get install -y apt-transport-https curl
curl https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub -s -o openvpn-repo-pkg-key.pub
apt-key add openvpn-repo-pkg-key.pub
curl https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list -s -o /etc/apt/sources.list.d/openvpn3.list
apt-get update -y && apt-get install -y openvpn3
