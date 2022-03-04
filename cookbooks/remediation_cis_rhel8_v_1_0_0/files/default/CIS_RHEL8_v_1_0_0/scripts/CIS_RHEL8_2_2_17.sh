#!/bin/bash
if rpm -qa | grep -q ypserv; then
  systemctl is-enabled -q ypserv && systemctl --now disable -q ypserv || echo 'Nothing to do, NIS server is not enabled'
else
  echo 'Nothing to do, NIS server is not installed'
fi