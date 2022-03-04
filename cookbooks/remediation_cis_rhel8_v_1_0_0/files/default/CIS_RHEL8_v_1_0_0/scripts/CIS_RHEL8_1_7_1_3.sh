#!/bin/bash
egrep -q "^SELINUXTYPE=.*$" /etc/selinux/config && sed -ri "s/^SELINUXTYPE=.*$/SELINUXTYPE=targeted/" /etc/selinux/config || echo "SELINUXTYPE=targeted" >> /etc/selinux/config