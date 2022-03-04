#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'iptables' ]; then
  if dnf list installed iptables; then
    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT
    iptables -A INPUT -s 127.0.0.0/8 -j DROP
  else
    echo 'Nothing to do, iptables is not installed'
  fi
else
  echo 'To configure iptables, environment variable $FIREWALL_PACKAGE must be set to "iptables"'
fi