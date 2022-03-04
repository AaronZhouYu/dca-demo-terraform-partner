#!/bin/bash
if [ ! -f /etc/systemd/journald.conf ]; then
  touch /etc/systemd/journald.conf
fi
egrep -q "^\s*Storage" /etc/systemd/journald.conf && sed -ri "s/^(\s*)Storage\s*=\s*\S+(\s*#.*)?\s*$/\1Storage=persistent\2/" /etc/systemd/journald.conf || echo "Storage=persistent" >> /etc/systemd/journald.conf