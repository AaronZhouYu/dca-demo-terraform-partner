#!/bin/bash
ssh_log_level=${SSH_LOG_LEVEL:-"INFO"}
if [[ $ssh_log_level == "INFO" || $ssh_log_level == "VERBOSE" ]]; then
  egrep -q "^(\s*)LogLevel\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)LogLevel\s+\S+(\s*#.*)?\s*$/\1LogLevel ${ssh_log_level}\2/" /etc/ssh/sshd_config || echo -e "\nLogLevel ${ssh_log_level}" >> /etc/ssh/sshd_config
else
  echo 'To configure SSH LogLevel, environment variable $SSH_LOG_LEVEL must be set to "INFO" or "VERBOSE"'
fi