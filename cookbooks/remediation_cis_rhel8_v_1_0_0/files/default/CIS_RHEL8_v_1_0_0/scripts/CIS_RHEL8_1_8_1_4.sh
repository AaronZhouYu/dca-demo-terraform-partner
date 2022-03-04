#!/bin/bash
if [ ! -f /etc/motd ]; then
  touch /etc/motd
fi

chown root:root /etc/motd
chmod 644 /etc/motd