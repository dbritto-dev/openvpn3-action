#!/bin/sh

set -e

SCRIPT="$1"
VPN_CLIENT_CONFIG="$2"
VPN_AUTOLOAD_CONFIG="$3"
VPN_CLIENT_DIR=$HOME/.openvpn3/client
VPN_CLIENT_CONFIG_PATH=$VPN_CLIENT_DIR/config.ovpn
VPN_CLIENT_AUTOLOAD_PATH=$VPN_CLIENT_DIR/config.autoload


mkdir -m700 -p $VPN_CLIENT_DIR
if [ -z "$VPN_AUTOLOAD_CONFIG" ]; then
  echo "$VPN_CLIENT_CONFIG" | base64 --decode >> $VPN_CLIENT_CONFIG_PATH
  sudo openvpn3 session-start --config $VPN_CLIENT_CONFIG_PATH
else
  echo "$VPN_CLIENT_CONFIG" | base64 --decode >> $VPN_CLIENT_CONFIG_PATH
  echo "$VPN_AUTOLOAD_CONFIG" | base64 --decode >> VPN_CLIENT_AUTOLOAD_PATH
  sudo openvpn3-autoload --directory $VPN_CLIENT_DIR
fi
while [ -z "$(sudo openvpn3 sessions-list | grep -io 'client connected')" ]; do
  sleep 0.1;
done

sh -c $SCRIPT
