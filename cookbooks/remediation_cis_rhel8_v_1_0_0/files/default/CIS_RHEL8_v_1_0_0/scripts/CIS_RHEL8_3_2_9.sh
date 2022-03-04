#!/bin/bash
egrep -q "^(\s*)net.ipv6.conf.all.accept_ra\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; accept_ra_rc=$?
egrep -q "^(\s*)net.ipv6.conf.all.accept_ra\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; accept_ra_d_rc=$?
egrep -q "^(\s*)net.ipv6.conf.default.accept_ra\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; accept_ra_default_rc=$?
egrep -q "^(\s*)net.ipv6.conf.default.accept_ra\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; accept_ra_default_d_rc=$?

if [ $accept_ra_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.accept_ra\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.accept_ra = 0\2/" /etc/sysctl.conf
elif [ $accept_ra_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.accept_ra\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.accept_ra = 0\2/" /etc/sysctl.d/*
else
  echo "net.ipv6.conf.all.accept_ra = 0" >> /etc/sysctl.conf
fi

if [ $accept_ra_default_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.default.accept_ra\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.default.accept_ra = 0\2/" /etc/sysctl.conf
elif [ $accept_ra_default_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.default.accept_ra\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.default.accept_ra = 0\2/" /etc/sysctl.d/*
else
  echo "net.ipv6.conf.default.accept_ra = 0" >> /etc/sysctl.conf
fi

sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
sysctl -w net.ipv6.route.flush=1