#!/bin/bash
if [ ! -f /etc/issue.net ]; then
  touch /etc/issue.net
fi

chown root:root /etc/issue.net
chmod u-x,go-wx /etc/issue.net