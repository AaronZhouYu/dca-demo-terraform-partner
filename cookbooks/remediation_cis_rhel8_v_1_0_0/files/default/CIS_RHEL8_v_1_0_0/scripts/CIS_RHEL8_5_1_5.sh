#!/bin/bash
if [ ! -d /etc/cron.weekly ]; then
  mkdir /etc/cron.weekly
fi
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly