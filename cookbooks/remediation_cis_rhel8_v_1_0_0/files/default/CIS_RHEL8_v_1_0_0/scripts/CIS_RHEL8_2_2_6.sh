#!/bin/bash
if rpm -qa | grep -q squid; then
  systemctl is-enabled -q squid && systemctl --now disable -q squid || echo 'Nothing to do, HTTP proxy server is not enabled'
else
  echo 'Nothing to do, HTTP proxy server is not installed'
fi