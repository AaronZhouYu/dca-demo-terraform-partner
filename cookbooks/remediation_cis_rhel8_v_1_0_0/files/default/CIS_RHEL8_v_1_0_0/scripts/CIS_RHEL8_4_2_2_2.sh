#!/bin/bash
if [ ! -f /etc/systemd/journald.conf ]; then
  touch /etc/systemd/journald.conf
fi
egrep -q "^\s*Compress" /etc/systemd/journald.conf && sed -ri "s/^(\s*)Compress\s*=\s*\S+(\s*#.*)?\s*$/\1Compress=yes\2/" /etc/systemd/journald.conf || echo "Compress=yes" >> /etc/systemd/journald.conf