#!/bin/bash
egrep -q "^(\s*)umask\s+\S+(\s*#.*)?\s*$" /etc/bashrc && sed -ri "s/^(\s*)umask\s+\S+(\s*#.*)?\s*$/\1umask 027\2/" /etc/bashrc || echo "umask 027" >> /etc/bashrc
egrep -q "^(\s*)umask\s+\S+(\s*#.*)?\s*$" /etc/profile && sed -ri "s/^(\s*)umask\s+\S+(\s*#.*)?\s*$/\1umask 027\2/" /etc/profile || echo "umask 027" >> /etc/profile
for file in /etc/profile.d/*.sh; do
  egrep -q "^(\s*)umask\s+\S+(\s*#.*)?\s*$" $file && sed -ri "s/^(\s*)umask\s+\S+(\s*#.*)?\s*$/\1umask 027\2/" $file || echo "umask 027" >> $file
done