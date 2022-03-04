#!/bin/bash
if rpm -qa | grep -q httpd; then
  systemctl is-enabled -q httpd && systemctl --now disable -q httpd || echo 'Nothing to do, HTTP server is not enabled'
else
  echo 'Nothing to do, HTTP server is not installed'
fi