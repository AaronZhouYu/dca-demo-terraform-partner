#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'firewalld' ]; then
  rpm -qa | grep -q firewalld && systemctl --now enable -q firewalld || echo 'Nothing to do, firewalld is not installed'
else
  echo 'To configure firewalld, environment variable $FIREWALL_PACKAGE must be set to "firewalld"'
fi