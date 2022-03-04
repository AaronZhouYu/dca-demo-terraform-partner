#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'firewalld' ]; then
  rpm -qa | grep -q iptables && systemctl --now mask -q iptables || echo 'Nothing to do, iptables is not installed'
else
  echo 'To configure firewalld, environment variable $FIREWALL_PACKAGE must be set to "firewalld"'
fi