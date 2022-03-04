#!/bin/bash
rpm -qa | grep -q audit && rpm -qa | grep -q audit-libs || dnf install -y audit audit-libs
if [[ $MAX_LOG_FILE =~ ^[0-9]+$ ]]; then
  sed -ri "s/max_log_file =.*$/max_log_file = $MAX_LOG_FILE/" /etc/audit/auditd.conf
else
  echo "Environment variable MAX_LOG_FILE must be set in order to configure audit log storage size"
fi