#!/bin/bash
useradd -D -f 30
users=`egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1`
if [ ! -z $users ]; then
  for user in $users; do
    chage --inactive 30 $user
  done
fi