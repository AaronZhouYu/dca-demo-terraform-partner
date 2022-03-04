#!/bin/bash
if rpm -q chrony >/dev/null; then
  chrony_config=(`grep -E ^\s*OPTIONS\s*=\s*"(.*?)" /etc/sysconfig/chronyd | cut -d '"' -f2`)
  if [[ ! ${chrony_config[@]} =~ "-u chrony" ]]; then
    chrony_config+=("-u chrony")
  fi
  sed -i '/OPTIONS=/d' /etc/sysconfig/chronyd; echo "OPTIONS=\"${chrony_config[@]}\"" >> /etc/sysconfig/chronyd
fi