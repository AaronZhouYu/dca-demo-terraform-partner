#!/bin/bash
if rpm -qa | grep -q cups; then
  systemctl is-enabled -q cups && systemctl --now disable -q cups || echo 'Nothing to do, CUPS is not enabled'
else
  echo 'Nothing to do, CUPS is not installed'
fi