#!/bin/bash
egrep -q "^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; filter_all_rc=$?
egrep -q "^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*.conf; filter_all_d_rc=$?
egrep -q "^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /usr/lib/sysctl.d/*.conf; filter_usr_lib_rc=$?
egrep -q "^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /run/sysctl.d/*.conf; filter_run_rc=$?
egrep -q "^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; filter_def_all_rc=$?
egrep -q "^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*.conf; filter__def_all_d_rc=$?
egrep -q "^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /usr/lib/sysctl.d/*.conf; filter_def_usr_lib_rc=$?
egrep -q "^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /run/sysctl.d/*.conf; filter_def_run_rc=$?

if [ $filter_all_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.rp_filter = 1\2/" /etc/sysctl.conf
elif [ $filter_all_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.rp_filter = 1\2/" /etc/sysctl.d/*.conf
elif [ $filter_usr_lib_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.rp_filter = 1\2/" /usr/lib/sysctl.d/*.conf
elif [ $filter_run_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.rp_filter = 1\2/" /run/sysctl.d/*.conf
else
  echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
fi

if [ $filter_def_all_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.rp_filter = 1\2/" /etc/sysctl.conf
elif [ $filter_def_all_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.rp_filter = 1\2/" /etc/sysctl.d/*.conf
elif [ $filter_def_usr_lib_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.rp_filter = 1\2/" /usr/lib/sysctl.d/*.conf
elif [ $filter_def_run_rc -eq 0 ]; then
  sed -ri "s/^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.rp_filter = 1\2/" /run/sysctl.d/*.conf
else
  echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
fi

sysctl -w net.ipv4.conf.all.rp_filter=1
sysctl -w net.ipv4.conf.default.rp_filter=1
sysctl -w net.ipv4.route.flush=1