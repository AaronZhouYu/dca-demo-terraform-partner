#!/bin/bash
if [ ! -d /etc/cron.d ]; then
  mkdir /etc/cron.d
fi
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d