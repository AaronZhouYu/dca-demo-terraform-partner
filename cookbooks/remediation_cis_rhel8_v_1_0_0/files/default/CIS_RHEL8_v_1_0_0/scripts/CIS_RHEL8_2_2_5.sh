#!/bin/bash
if rpm -qa | grep -q net-snmp && rpm -qa | grep -q net-snmp-utils; then
  systemctl is-enabled -q snmpd && systemctl --now disable -q snmpd || echo 'Nothing to do, SNMP server is not enabled'
else
  echo 'Nothing to do, SNMP server is not installed'
fi