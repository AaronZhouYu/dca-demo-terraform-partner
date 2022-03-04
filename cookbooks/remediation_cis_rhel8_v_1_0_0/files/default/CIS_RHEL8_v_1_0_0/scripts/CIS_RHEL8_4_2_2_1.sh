#!/bin/bash
if [ ! -f /etc/systemd/journald.conf ]; then
  touch /etc/systemd/journald.conf
fi
egrep -q "^\s*ForwardToSyslog" /etc/systemd/journald.conf && sed -ri "s/^(\s*)ForwardToSyslog\s*=\s*\S+(\s*#.*)?\s*$/\1ForwardToSyslog=yes\2/" /etc/systemd/journald.conf || echo "ForwardToSyslog=yes" >> /etc/systemd/journald.conf