#!/bin/bash
egrep -q '^(\s*)gpgcheck\s*=\s*\S+(\s*#.*)?\s*$' /etc/yum.conf && sed -ri 's/^(\s*)gpgcheck\s*=\s*\S+(\s*#.*)?\s*$/\1gpgcheck=1\2/' /etc/yum.conf || echo 'gpgcheck=1' >> /etc/yum.conf
for file in /etc/yum.repos.d/*; do
  egrep -q '^(\s*)gpgcheck\s*=\s*\S+(\s*#.*)?\s*$' $file && sed -ri 's/^(\s*)gpgcheck\s*=\s*\S+(\s*#.*)?\s*$/\1gpgcheck=1\2/' $file || echo 'gpgcheck=1' >> $file
done