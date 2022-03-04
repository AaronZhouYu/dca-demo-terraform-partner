#!/bin/bash
tmout=${USER_SHELL_TIMEOUT:-900}
egrep -q '^(\s*)TMOUT=[0-9]*$' /etc/bashrc && sed -ri "s/^(\s*)TMOUT=[0-9]*$/\1TMOUT=${tmout}\1/" /etc/bashrc || echo "TMOUT=${tmout}" >> /etc/bashrc
egrep -q '^(\s*)TMOUT=[0-9]*$' /etc/profile && sed -ri "s/^(\s*)TMOUT=[0-9]*$/\1TMOUT=${tmout}\1/" /etc/profile || echo "TMOUT=${tmout}" >> /etc/profile
for file in /etc/profile.d/*.sh; do
  egrep -q '^(\s*)TMOUT=[0-9]*$' $file && sed -ri "s/^(\s*)TMOUT=[0-9]*$/\1TMOUT=${tmout}\1/" $file || echo "TMOUT=${tmout}" >> $file
done