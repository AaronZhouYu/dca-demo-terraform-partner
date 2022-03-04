#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'firewalld' ]; then
  rpm -qa | grep -q firewalld || dnf -y install firewalld
  sleep 2
elif [ $firewall_package == 'nftables' ]; then
  rpm -qa | grep -q nftables || dnf -y install nftables
  sleep 2
elif [ $firewall_package == 'iptables' ]; then
  rpm -qa | grep -q iptables || dnf -y install iptables
  sleep 2
else
  echo 'To install a Firewall package, environment variable $FIREWALL_PACKAGE must be set to "firewalld", "nftables" or "iptables"'
fi