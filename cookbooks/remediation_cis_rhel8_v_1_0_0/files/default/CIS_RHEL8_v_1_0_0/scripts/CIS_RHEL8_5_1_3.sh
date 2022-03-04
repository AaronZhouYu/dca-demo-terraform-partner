#!/bin/bash
if [ ! -d  /etc/cron.hourly ]; then
  mkdir /etc/cron.hourly
fi
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly