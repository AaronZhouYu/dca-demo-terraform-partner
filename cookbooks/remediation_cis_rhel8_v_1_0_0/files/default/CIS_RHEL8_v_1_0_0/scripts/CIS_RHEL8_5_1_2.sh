#!/bin/bash
if [ ! -f /etc/crontab ]; then
  touch /etc/crontab
fi
chown root:root /etc/crontab
chmod og-rwx /etc/crontab