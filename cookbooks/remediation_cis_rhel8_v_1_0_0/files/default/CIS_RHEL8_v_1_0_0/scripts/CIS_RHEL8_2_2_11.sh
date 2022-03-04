#!/bin/bash
if rpm -qa | grep -q bind && rpm -qa | grep -q bind-utils; then
  systemctl is-enabled -q named && systemctl --now disable -q named || echo 'Nothing to do, DNS server is not enabled'
else
  echo 'Nothing to do, DNS server is not installed'
fi