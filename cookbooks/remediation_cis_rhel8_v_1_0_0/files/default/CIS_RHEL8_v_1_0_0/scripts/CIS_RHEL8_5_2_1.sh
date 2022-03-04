#!/bin/bash
if [ ! -f /etc/ssh/sshd_config ]; then
  touch /etc/ssh/sshd_config
fi
chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config