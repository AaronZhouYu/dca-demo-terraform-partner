#!/bin/bash
if rpm -qa | grep -q vsftpd; then
  systemctl is-enabled -q vsftpd && systemctl --now disable -q vsftpd || echo 'Nothing to do, FTP server is not enabled'
else
  echo 'Nothing to do, FTP server is not installed'
fi