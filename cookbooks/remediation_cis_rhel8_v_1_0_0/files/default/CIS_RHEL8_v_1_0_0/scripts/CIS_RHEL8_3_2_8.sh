#!/bin/bash
egrep -q "^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; tcp_syncookies_rc=$?
egrep -q "^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*.conf; tcp_syncookies_d_rc=$?
egrep -q "^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$" /usr/lib/sysctl.d/*.conf; tcp_syncookies_usr_lib_rc=$?
egrep -q "^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$" /run/sysctl.d/*.conf; tcp_syncookies_run_rc=$?

if [ $tcp_syncookies_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.tcp_syncookies = 1\2/" /etc/sysctl.conf
elif [ $tcp_syncookies_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.tcp_syncookies = 1\2/" /etc/sysctl.d/*.conf
elif [ $tcp_syncookies_usr_lib_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.tcp_syncookies = 1\2/" /usr/lib/sysctl.d/*.conf
elif [ $tcp_syncookies_run_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.tcp_syncookies = 1\2/" /run/sysctl.d/*.conf
else
  echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf
fi

sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.ipv4.route.flush=1