#!/bin/bash
if egrep -q '^\s*password\s+requisite\s+pam_pwhistory\.so\s+.*remember=([5-9]|[1-4][0-9])[0-9]*\s*.*$' /etc/pam.d/system-auth; then
  sed -ri 's/(^\s*password\s+requisite\s+pam_pwhistory.so(\s+\S+)*\s+)remember=([5-9]|[1-4][0-9])[0-9]*\s*.*$/\1remember=5\3/' /etc/pam.d/system-auth
elif egrep -q '^\s*password\s+requisite\s+pam_pwhistory.so(\s+\S+)*$' /etc/pam.d/system-auth; then
  sed -ri 's/^\s*password\s+requisite\s+pam_pwhistory.so(\s+\S+)*\s*$/& remember=5/' /etc/pam.d/system-auth
else
  echo 'password requisite pam_pwhistory.so remember=5' >> /etc/pam.d/system-auth
fi
if egrep -q '^\s*password\s+sufficient\s+pam_unix\.so\s+.*remember=([5-9]|[1-4][0-9])[0-9]*\s*.*$' /etc/pam.d/system-auth; then
  sed -ri 's/(^\s*password\s+sufficient\s+pam_unix.so(\s+\S+)*\s+)remember=([5-9]|[1-4][0-9])[0-9]*\s*.*$/\1remember=5\3/' /etc/pam.d/system-auth
elif egrep -q '^\s*password\s+sufficient\s+pam_unix.so(\s+\S+)*$' /etc/pam.d/system-auth; then
  sed -ri 's/^\s*password\s+sufficient\s+pam_unix.so(\s+\S+)*\s*$/& remember=5/' /etc/pam.d/system-auth
else
  echo 'password sufficient pam_unix.so remember=5' >> /etc/pam.d/system-auth
fi