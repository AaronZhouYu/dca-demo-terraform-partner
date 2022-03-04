#!/bin/bash
egrep -q '^(\s*)Defaults\s+logfile=\".*\"\s*$' /etc/sudoers; sudoers_rc=$?
egrep -q '^(\s*)Defaults\s+logfile=\".*\"\s*$' /etc/sudoers.d/*; sudoers_d_rc=$?
if [ $sudoers_rc -eq 1 ] && [ $sudoers_d_rc -eq 1 ]; then
  if [[ $SUDO_LOG_FILE ]]; then
    echo "Defaults logfile=\"$SUDO_LOG_FILE\"" >> /etc/sudoers
  else
    echo 'Environment variable SUDO_LOG_FILE must be set to configure sudo log file'
  fi
else
  echo 'Nothing to do, sudo log file configured'
fi