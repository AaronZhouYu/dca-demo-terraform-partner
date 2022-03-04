#!/bin/bash
egrep -q "^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; ip_fwd_rc=$?
egrep -q "^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*.conf; ip_fwd_d_rc=$?
egrep -q "^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$" /usr/lib/sysctl.d/*.conf; ip_fwd_usr_lib_rc=$?
egrep -q "^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$" /run/sysctl.d/*.conf; ip_fwd_run_rc=$?

egrep -q "^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; ipv6_fwd_rc=$?
egrep -q "^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*.conf; ipv6_fwd_d_rc=$?
egrep -q "^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$" /usr/lib/sysctl.d/*.conf; ipv6_fwd_usr_lib_rc=$?
egrep -q "^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$" /run/sysctl.d/*.conf; ipv6_fwd_run_rc=$?

if [ $ip_fwd_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.ip_forward = 0\2/" /etc/sysctl.conf
elif [ $ip_fwd_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.ip_forward = 0\2/" /etc/sysctl.d/*.conf
elif [ $ip_fwd_usr_lib_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.ip_forward = 0\2/" /usr/lib/sysctl.d/*.conf
elif [ $ip_fwd_run_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.ip_forward = 0\2/" /run/sysctl.d/*.conf
else
  echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
fi

if [ $ipv6_fwd_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.forwarding = 0\2/" /etc/sysctl.conf
elif [ $ipv6_fwd_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.forwarding = 0\2/" /etc/sysctl.d/*.conf
elif [ $ipv6_fwd_usr_lib_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.forwarding = 0\2/" /usr/lib/sysctl.d/*.conf
elif [ $ipv6_fwd_run_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv6.conf.all.forwarding\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv6.conf.all.forwarding = 0\2/" /run/sysctl.d/*.conf
else
  echo "net.ipv6.conf.all.forwarding = 0" >> /etc/sysctl.conf
fi

sysctl -w net.ipv4.ip_forward=0
sysctl -w net.ipv6.conf.all.forwarding=0
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1