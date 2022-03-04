#!/bin/bash
if rpm -qa | grep -q avahi; then
  systemctl is-enabled -q avahi-daemon && systemctl --now disable -q avahi-daemon || echo 'Nothing to do, avahi server is not enabled'
else
  echo 'Nothing to do, avahi server is not installed'
fi