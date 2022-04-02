#!/bin/sh

VPN_SESSION_PATH="$(openvpn3 sessions-list | grep -io /net/openvpn/v3/sessions/[a-z0-9]*)"
openvpn3 session-manage --session-path $VPN_SESSION_PATH --disconnect
rm -rf $HOME/.openvpn3
