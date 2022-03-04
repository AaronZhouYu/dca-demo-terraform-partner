#!/bin/bash
egrep -q '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' /etc/pam.d/password-auth || sed -ri 's/^\s*password\s+sufficient\s+pam_unix.so.*$/password sufficient pam_unix.so sha512/' /etc/pam.d/password-auth
egrep -q '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' /etc/pam.d/password-auth || echo 'password sufficient pam_unix.so sha512' >> /etc/pam.d/password-auth
egrep -q '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' /etc/pam.d/system-auth || sed -ri 's/^\s*password\s+sufficient\s+pam_unix.so.*$/password sufficient pam_unix.so sha512/' /etc/pam.d/system-auth
egrep -q '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' /etc/pam.d/system-auth || echo 'password sufficient pam_unix.so sha512' >> /etc/pam.d/system-auth