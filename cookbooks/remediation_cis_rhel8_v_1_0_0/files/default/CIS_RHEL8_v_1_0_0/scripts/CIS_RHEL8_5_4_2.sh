#!/bin/bash
if egrep -q '^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+(deny=[0-9]+(\s+\S+)*\s+unlock_time=[0-9]+|unlock_time=[0-9]+(\s+\S+)*\s+deny=[0-9]+)(\s+.*)?$' /etc/pam.d/password-auth; then
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)deny=[0-9]+(\s+.*)?$/\1deny=5\3/' /etc/pam.d/password-auth
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)unlock_time=[0-9]+(\s+.*)?$/\1unlock_time=900\3/' /etc/pam.d/password-auth
elif egrep -q '^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+deny=[0-9]+(\s+.*)?$' /etc/pam.d/password-auth; then
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)deny=[0-9]+(\s+.*)?$/\1deny=5\3/' /etc/pam.d/password-auth
  sed -ri 's/^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s*$/& unlock_time=900/' /etc/pam.d/password-auth
elif egrep -q '^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+unlock_time=[0-9]+(\s+.*)?$' /etc/pam.d/password-auth; then
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)unlock_time=[0-9]+(\s+.*)?$/\1unlock_time=900\3/' /etc/pam.d/password-auth
  sed -ri 's/^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s*$/& deny=5/' /etc/pam.d/password-auth
else
  echo 'auth required pam_faillock.so deny=5 unlock_time=900' >> /etc/pam.d/password-auth
fi
if egrep -q '^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+(deny=[0-9]+(\s+\S+)*\s+unlock_time=[0-9]+|unlock_time=[0-9]+(\s+\S+)*\s+deny=[0-9]+)(\s+.*)?$' /etc/pam.d/system-auth; then
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)deny=[0-9]+(\s+.*)?$/\1deny=5\3/' /etc/pam.d/system-auth
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)unlock_time=[0-9]+(\s+.*)?$/\1unlock_time=900\3/' /etc/pam.d/system-auth
elif egrep -q '^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+deny=[0-9]+(\s+.*)?$' /etc/pam.d/system-auth; then
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)deny=[0-9]+(\s+.*)?$/\1deny=5\3/' /etc/pam.d/system-auth
  sed -ri 's/^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s*$/& unlock_time=900/' /etc/pam.d/system-auth
elif egrep -q '^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+unlock_time=[0-9]+(\s+.*)?$' /etc/pam.d/system-auth; then
  sed -ri 's/(^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s+)unlock_time=[0-9]+(\s+.*)?$/\1unlock_time=900\3/' /etc/pam.d/system-auth
  sed -ri 's/^\s*auth\s+required\s+pam_faillock.so(\s+\S+)*\s*$/& deny=5/' /etc/pam.d/system-auth
else
  echo 'auth required pam_faillock.so deny=5 unlock_time=900' >> /etc/pam.d/system-auth
fi