#!/bin/bash
egrep -q "^SELINUX=.*$" /etc/selinux/config && sed -ri "s/^SELINUX=.*$/SELINUX=enforcing/" /etc/selinux/config || echo "SELINUX=enforcing" >> /etc/selinux/config