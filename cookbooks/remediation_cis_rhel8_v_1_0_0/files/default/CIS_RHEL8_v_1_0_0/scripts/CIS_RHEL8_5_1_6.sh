#!/bin/bash
if [ ! -d /etc/cron.monthly ]; then
  mkdir /etc/cron.monthly
fi
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly