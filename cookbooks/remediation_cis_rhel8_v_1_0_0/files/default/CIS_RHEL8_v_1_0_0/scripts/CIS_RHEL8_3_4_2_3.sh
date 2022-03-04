#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'firewalld' ]; then
  rpm -qa | grep -q nftables && systemctl --now mask -q nftables || echo 'Nothing to do, nftables is not installed'
else
  echo 'To configure firewalld, environment variable $FIREWALL_PACKAGE must be set to "firewalld"'
fi