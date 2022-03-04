#!/bin/bash
if [ ! -d /etc/cron.daily ]; then
  mkdir /etc/cron.daily
fi
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily