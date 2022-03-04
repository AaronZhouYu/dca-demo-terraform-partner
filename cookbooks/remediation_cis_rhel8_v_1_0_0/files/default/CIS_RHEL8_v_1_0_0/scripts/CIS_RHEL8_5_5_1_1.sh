#!/bin/bash
egrep -q "^(\s*)PASS_MAX_DAYS\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_MAX_DAYS\s+\S+(\s*#.*)?\s*$/\PASS_MAX_DAYS 365\2/" /etc/login.defs || echo "PASS_MAX_DAYS 365" >> /etc/login.defs
users=`egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1`
if [ ! -z $users ]; then
  for user in $users; do
    chage --maxdays 365 $user
  done
fi