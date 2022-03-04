#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'nftables' ]; then
  if rpm -qa | grep -q nftables; then
    nftables_name=${NFTABLES_NAME:-"filter"}
    nft list tables | egrep -q '.*' || nft create table inet ${nftables_name}
  else
    echo 'Nothing to do, nftables is not installed'
  fi
else
  echo 'To configure nftables, environment variable $FIREWALL_PACKAGE must be set to "nftables"'
fi