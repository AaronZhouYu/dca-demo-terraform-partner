#!/bin/bash
if rpm -qa | grep -q openldap-servers; then
  systemctl is-enabled -q slapd && systemctl --now disable -q slapd || echo 'Nothing to do, LDAP server is not enabled'
else
  echo 'Nothing to do, LDAP server is not installed'
fi