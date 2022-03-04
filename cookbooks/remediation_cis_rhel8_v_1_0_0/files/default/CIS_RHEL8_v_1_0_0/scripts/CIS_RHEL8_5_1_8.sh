#!/bin/bash
if [ -f /etc/cron.deny ]; then
  rm /etc/cron.deny
fi
if [ -f /etc/at.deny ]; then
  rm /etc/at.deny
fi
if [ ! -f /etc/cron.allow ]; then
  touch /etc/cron.allow
fi
if [ ! -f /etc/at.allow ]; then
  touch /etc/at.allow
fi
chmod og-rwx /etc/cron.allow
chmod og-rwx /etc/at.allow
chown root:root /etc/cron.allow
chown root:root /etc/at.allow