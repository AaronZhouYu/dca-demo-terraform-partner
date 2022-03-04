#!/bin/bash
if rpm -qa | grep -q dhcp-server; then
  systemctl is-enabled -q dhcpd && systemctl --now disable -q dhcpd || echo 'Nothing to do, DHCP server is not enabled'
else
  echo 'Nothing to do, DHCP server is not installed'
fi