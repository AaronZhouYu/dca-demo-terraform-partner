#!/bin/bash
if [ ! -f /etc/issue ]; then
  touch /etc/issue
fi

sed -ri 's/(\\v|\\r|\\m|\\s|[Rr][Hh][Ee][Ll])//g' /etc/issue