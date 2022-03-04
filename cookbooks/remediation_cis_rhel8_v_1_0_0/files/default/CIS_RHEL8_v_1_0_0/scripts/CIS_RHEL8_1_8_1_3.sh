#!/bin/bash
if [ ! -f /etc/issue.net ]; then
  touch /etc/issue.net
fi

sed -ri 's/(\\v|\\r|\\m|\\s|[Rr][Hh][Ee][Ll])//g' /etc/issue.net