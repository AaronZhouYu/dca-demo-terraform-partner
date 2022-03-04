#!/bin/bash
egrep -q "^(\s*)kernel.randomize_va_space\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; sysctl_conf_rc=$?
egrep -q "^(\s*)kernel.randomize_va_space\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; sysctl_d_rc=$?

if [ $sysctl_conf_rc -eq 0 ]; then
  sed -ri "s/^(\s*)kernel.randomize_va_space\s*=\s*\S+(\s*#.*)?\s*$/\1kernel.randomize_va_space = 2\2/" /etc/sysctl.conf
elif [ $sysctl_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)kernel.randomize_va_space\s*=\s*\S+(\s*#.*)?\s*$/\1kernel.randomize_va_space = 2\2/" /etc/sysctl.d/*.conf
else
  echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
fi

sysctl -w kernel.randomize_va_space=2