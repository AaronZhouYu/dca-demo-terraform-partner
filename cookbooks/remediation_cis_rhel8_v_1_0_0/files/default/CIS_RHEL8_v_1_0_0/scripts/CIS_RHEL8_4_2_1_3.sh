#!/bin/bash
if rpm -qa | grep -q rsyslog; then
  grep -q "FileCreateMode" /etc/rsyslog.conf && sed -ri "s/\\\$FileCreateMode.*$/\\\$FileCreateMode 0640/" /etc/rsyslog.conf || echo "\$FileCreateMode 0640" >> /etc/rsyslog.conf
  for i in `find /etc/rsyslog.d/ -name "*.conf" -type f`; do
    grep -q "FileCreateMode" $i && sed -ri "s/\\\$FileCreateMode.*$/\\\$FileCreateMode 0640/" $i || echo "\$FileCreateMode 0640" >> $i
  done
else
  echo 'Nothing to do, rsyslog is not installed'
fi