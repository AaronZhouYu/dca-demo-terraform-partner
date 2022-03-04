#!/bin/bash
rpm -qa | grep -q openldap-clients && dnf -yq remove openldap-clients || echo 'Nothing to do, LDAP client is not installed'