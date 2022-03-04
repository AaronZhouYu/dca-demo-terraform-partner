#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'iptables' ]; then
  if dnf list installed iptables; then
    egrep -q "^\s*kernelopts=(\S+\s+)*ipv6\.disable=1\b\s*(\S+\s*)*$" /boot/grub2/grubenv; ipv6_disabled_rc=$?
    if [ $ipv6_disabled_rc -eq 1 ]; then
      ip6tables -A INPUT -i lo -j ACCEPT
      ip6tables -A OUTPUT -o lo -j ACCEPT
      ip6tables -A INPUT -s ::1 -j DROP
    else
      echo 'Nothing to do, IPv6 is disabled'
    fi
  else
    echo 'Nothing to do, iptables is not installed'
  fi
else
  echo 'To configure iptables, environment variable $FIREWALL_PACKAGE must be set to "iptables"'
fi