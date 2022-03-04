#!/bin/bash
egrep -q "^(\s*)minlen\s*=\s*\S+(\s*#.*)?\s*$" /etc/security/pwquality.conf && sed -ri "s/^(\s*)minlen\s*=\s*\S+(\s*#.*)?\s*$/\minlen = 14\2/" /etc/security/pwquality.conf || echo "minlen = 14" >> /etc/security/pwquality.conf
egrep -q "^(\s*)minclass\s*=\s*\S+(\s*#.*)?\s*$" /etc/security/pwquality.conf && sed -ri "s/^(\s*)minclass\s*=\s*\S+(\s*#.*)?\s*$/\minclass = 4\2/" /etc/security/pwquality.conf || echo "minclass = 4" >> /etc/security/pwquality.conf
if egrep -q '^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*\s+retry=[0-9]+(\s+.*)?$' /etc/pam.d/system-auth; then
  sed -ri 's/(^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*\s+)retry=[0-9]+(\s+.*)?$/\1retry=3\3/' /etc/pam.d/system-auth
elif egrep -q '^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*$' /etc/pam.d/system-auth; then
  sed -ri 's/^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*\s*$/& retry=3/' /etc/pam.d/system-auth
else
  echo 'password requisite pam_pwquality.so retry=3' >> /etc/pam.d/system-auth
fi
if egrep -q '^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*\s+retry=[0-9]+(\s+.*)?$' /etc/pam.d/password-auth; then
  sed -ri 's/(^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*\s+)retry=[0-9]+(\s+.*)?$/\1retry=3\3/' /etc/pam.d/password-auth
elif egrep -q '^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*$' /etc/pam.d/password-auth; then
  sed -ri 's/^\s*password\s+requisite\s+pam_pwquality.so(\s+\S+)*\s*$/& retry=3/' /etc/pam.d/password-auth
else
  echo 'password requisite pam_pwquality.so retry=3' >> /etc/pam.d/password-auth
fi