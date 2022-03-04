#!/bin/bash
firewall_package=${FIREWALL_PACKAGE:-"firewalld"}
if [ $firewall_package == 'nftables' ]; then
  if rpm -qa | grep -q nftables; then
    nftables_name=${NFTABLES_NAME:-"filter"}
    nft list tables | egrep -q "inet\s${nftables_name}" || nft create table inet ${nftables_name}
    nft list table inet ${nftables_name} | egrep -q 'chain\sinput' || nft add chain inet ${nftables_name} input { type filter hook input priority 0 \; }
    nft list ruleset | awk '/hook input/,/}/' | grep -q 'iif "lo" accept' || nft add rule inet ${nftables_name} input iif lo accept
    nft list ruleset | awk '/hook input/,/}/' | grep -q 'ip sddr' || nft add rule inet ${nftables_name} input ip saddr 127.0.0.0/8 counter drop
    nft list ruleset | awk '/hook input/,/}/' | grep -q 'ip6 saddr' || nft add rule inet ${nftables_name} input ip6 saddr ::1 counter drop
  else
    echo 'Nothing to do, nftables is not installed'
  fi
else
  echo 'To configure nftables, environment variable $FIREWALL_PACKAGE must be set to "nftables"'
fi