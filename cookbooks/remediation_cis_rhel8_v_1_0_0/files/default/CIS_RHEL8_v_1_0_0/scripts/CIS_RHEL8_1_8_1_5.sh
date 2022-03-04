#!/bin/bash
if [ ! -f /etc/issue ]; then
  touch /etc/issue
fi

chown root:root /etc/issue
chmod u-x,go-wx /etc/issue