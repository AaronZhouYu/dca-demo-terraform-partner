#!/bin/bash
if rpm -qa | grep -q samba; then
  systemctl is-enabled -q smb && systemctl --now disable -q smb || echo 'Nothing to do, Samba is not enabled'
else
  echo 'Nothing to do, Samba is not installed'
fi