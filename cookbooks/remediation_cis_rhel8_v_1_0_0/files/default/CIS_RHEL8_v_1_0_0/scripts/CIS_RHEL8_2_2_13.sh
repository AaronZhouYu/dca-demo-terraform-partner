#!/bin/bash
if rpm -qa | grep -q rpcbind; then
  systemctl is-enabled -q rpcbind && systemctl --now disable -q rpcbind || echo 'Nothing to do, RPC is not enabled'
else
  echo 'Nothing to do, RPC is not installed'
fi