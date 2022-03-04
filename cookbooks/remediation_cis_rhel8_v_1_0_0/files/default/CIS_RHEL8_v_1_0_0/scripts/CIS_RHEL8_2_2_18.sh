#!/bin/bash
if rpm -qa | grep -q postfix; then
  egrep -q "^inet_interfaces\s*=\s.*" /etc/postfix/main.cf && sed -ri '/^#/!s/inet_interfaces\s*=\s.*/inet_interfaces = loopback-only/' /etc/postfix/main.cf || echo 'inet_interfaces = loopback-only' >> /etc/postfix/main.cf
  systemctl restart postfix
else
  echo 'Nothing to do, Postfix is not installed'
fi