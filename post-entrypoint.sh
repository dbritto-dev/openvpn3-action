#!/bin/sh

VPN_SESSION_PATH="$(sudo openvpn3 sessions-list | grep -io /net/openvpn/v3/sessions/[a-z0-9]*)"
sudo openvpn3 session-manage --session-path $VPN_SESSION_PATH --disconnect
sudo rm -rf $HOME/.openvpn3
