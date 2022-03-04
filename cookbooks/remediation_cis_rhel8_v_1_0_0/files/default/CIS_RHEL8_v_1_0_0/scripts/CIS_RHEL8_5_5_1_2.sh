#!/bin/bash
egrep -q "^(\s*)PASS_MIN_DAYS\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_MIN_DAYS\s+\S+(\s*#.*)?\s*$/\PASS_MIN_DAYS 7\2/" /etc/login.defs || echo "PASS_MIN_DAYS 7" >> /etc/login.defs
users=`egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1`
if [ ! -z $users ]; then
  for user in $users; do
    chage --mindays 7 $user
  done
fi