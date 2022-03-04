#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'nftables' ]; then
  if rpm -qa | grep -q nftables; then
    nftables_name=${NFTABLES_NAME:-"filter"}
    nft list tables | egrep -q '.*' || nft create table inet ${nftables_name}
    nft list ruleset | grep -q 'hook input' || nft create chain inet ${nftables_name} input { type filter hook input priority 0 \; }
    nft list ruleset | grep -q 'hook forward' || nft create chain inet ${nftables_name} forward { type filter hook forward priority 0 \; }
    nft list ruleset | grep -q 'hook output' || nft create chain inet ${nftables_name} output { type filter hook output priority 0 \; }
  else
    echo 'Nothing to do, nftables is not installed'
  fi
else
  echo 'To configure nftables, environment variable $FIREWALL_PACKAGE must be set to "nftables"'
fi