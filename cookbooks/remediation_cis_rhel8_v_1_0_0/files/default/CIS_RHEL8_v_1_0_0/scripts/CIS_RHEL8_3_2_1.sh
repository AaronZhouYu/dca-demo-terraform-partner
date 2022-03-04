#!/bin/bash
egrep -q "^(\s*)net.ipv4.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; source_route_all_rc=$?
egrep -q "^(\s*)net.ipv4.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; source_route_all_d_rc=$?
egrep -q "^(\s*)net.ipv4.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; source_route_default_rc=$?
egrep -q "^(\s*)net.ipv4.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; source_route_default_d_rc=$?
egrep -q "^(\s*)net.ipv6.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; ipv6_source_route_all_rc=$?
egrep -q "^(\s*)net.ipv6.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; ipv6_source_route_all_d_rc=$?
egrep -q "^(\s*)net.ipv6.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; ipv6_source_route_default_rc=$?
egrep -q "^(\s*)net.ipv6.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; ipv6_source_route_default_d_rc=$?

if [ $source_route_all_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.accept_source_route = 0\2/" /etc/sysctl.conf
elif [ $source_route_all_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.accept_source_route = 0\2/" /etc/sysctl.d/*
else
  echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
fi

if [ $source_route_default_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.accept_source_route = 0\2/" /etc/sysctl.conf
elif [ $source_route_default_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.accept_source_route = 0\2/" /etc/sysctl.d/*
else
  echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf
fi

if [ $ipv6_source_route_all_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.accept_source_route = 0\2/" /etc/sysctl.conf
elif [ $ipv6_source_route_all_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.accept_source_route = 0\2/" /etc/sysctl.d/*
else
  echo "net.ipv6.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
fi

if [ $ipv6_source_route_default_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.default.accept_source_route = 0\2/" /etc/sysctl.conf
elif [ $ipv6_source_route_default_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.default.accept_source_route = 0\2/" /etc/sysctl.d/*
else
  echo "net.ipv6.conf.default.accept_source_route = 0" >> /etc/sysctl.conf
fi

sysctl -w net.ipv4.conf.all.accept_source_route=0
sysctl -w net.ipv4.conf.default.accept_source_route=0
sysctl -w net.ipv6.conf.all.accept_source_route=0
sysctl -w net.ipv6.conf.default.accept_source_route=0
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1