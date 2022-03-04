#!/bin/bash
egrep -q "^(\s*)\*\s+hard\s+core\s+\S+(\s*#.*)?\s*$" /etc/security/limits.conf; limits_conf_rc=$?
egrep -q "^(\s*)\*\s+hard\s+core\s+\S+(\s*#.*)?\s*$" /etc/security/limits.d/*; limits_d_rc=$

if [ $limits_conf_rc -eq 0 ]; then
  sed -ri "s/^(\s*)\*\s+hard\s+core\s+\S+(\s*#.*)?\s*$/\1* hard core 0\2/" /etc/security/limits.conf
elif [ $limits_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)\*\s+hard\s+core\s+\S+(\s*#.*)?\s*$/\1* hard core 0\2/" /etc/security/limits.d/*.conf
else
  echo "* hard core 0" >> /etc/security/limits.conf
fi

egrep -q "^(\s*)fs.suid_dumpable\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf; sysctl_conf_rc=$?
egrep -q "^(\s*)fs.suid_dumpable\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.d/*; sysctl_d_rc=$

if [ $sysctl_conf_rc -eq 0 ]; then
  sed -ri "s/^(\s*)fs.suid_dumpable\s*=\s*\S+(\s*#.*)?\s*$/\1fs.suid_dumpable = 0\2/" /etc/sysctl.conf
elif [ $sysctl_d_rc -eq 0 ]; then
  sed -ri "s/^(\s*)fs.suid_dumpable\s*=\s*\S+(\s*#.*)?\s*$/\1fs.suid_dumpable = 0\2/" /etc/sysctl.d/*.conf
else
  echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
fi

sysctl -w fs.suid_dumpable=0

if [ -f /usr/lib/systemd/systemd-coredump ]; then
  if [ ! -f /etc/systemd/coredump.conf ]; then
    touch /etc/systemd/coredump.conf
  fi
  egrep -q '^\s*Storage=(.*)$' /etc/systemd/coredump.conf && sed -ri 's/^\s*Storage=(.*)$/Storage=none/' /etc/systemd/coredump.conf || echo 'Storage=none' >> /etc/systemd/coredump.conf
  egrep -q '^\s*ProcessSizeMax=(.*)$' /etc/systemd/coredump.conf && sed -ri 's/^\s*ProcessSizeMax=(.*)$/ProcessSizeMax=0/' /etc/systemd/coredump.conf || echo 'ProcessSizeMax=0' >> /etc/systemd/coredump.conf
  systemctl daemon-reload
fi