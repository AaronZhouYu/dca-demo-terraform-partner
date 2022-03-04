#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'nftables' ]; then
  if rpm -qa | grep -q nftables; then
    systemctl unmask nftables
    systemctl --now enable -q nftables
  else
    echo 'Nothing to do, nftables is not installed'
  fi
else
  echo 'To configure nftables, environment variable $FIREWALL_PACKAGE must be set to "nftables"'
fi