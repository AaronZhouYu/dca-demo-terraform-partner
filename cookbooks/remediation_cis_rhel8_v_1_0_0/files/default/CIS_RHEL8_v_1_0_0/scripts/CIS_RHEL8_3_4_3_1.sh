#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'nftables' ]; then
  rpm -qa | grep -q iptables && iptables -F && ip6tables -F && systemctl --now disable -q iptables || echo 'Nothing to do, iptables is not installed'
else
  echo 'To configure nftables, environment variable $FIREWALL_PACKAGE must be set to "nftables"'
fi