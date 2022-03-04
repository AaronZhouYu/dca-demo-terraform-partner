#!/bin/bash
if [ ! -f /etc/motd ]; then
  touch /etc/motd
fi

sed -ri 's/(\\v|\\r|\\m|\\s|[Rr][Hh][Ee][Ll])//g' /etc/motd