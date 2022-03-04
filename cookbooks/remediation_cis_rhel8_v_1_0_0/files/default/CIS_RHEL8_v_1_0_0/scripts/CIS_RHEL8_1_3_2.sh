#!/bin/bash
egrep -q '^(\s*)Defaults\s+use_pty\s*$' /etc/sudoers; sudoers_rc=$?
egrep -q '^(\s*)Defaults\s+use_pty\s*$' /etc/sudoers.d/*; sudoers_d_rc=$?

if [ $sudoers_rc -eq 1 ] && [ $sudoers_d_rc -eq 1 ]; then
  echo 'Defaults use_pty' >> /etc/sudoers
fi