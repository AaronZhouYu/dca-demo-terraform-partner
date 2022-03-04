#!/bin/bash
if rpm -qa | grep -q rsync && rpm -qa | grep -q rsync-daemon; then
  systemctl is-enabled -q rsyncd && systemctl --now disable -q rsyncd || echo 'Nothing to do, rsync service is not enabled'
else
  echo 'Nothing to do, rsync service is not installed'
fi