#!/bin/bash
if rpm -qa | grep -q nfs-utils; then
  systemctl is-enabled -q nfs-server && systemctl --now disable -q nfs-server || echo 'Nothing to do, NFS is not enabled'
else
  echo 'Nothing to do, NFS is not installed'
fi