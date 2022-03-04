# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_14 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_14')
    @title = 'Ensure LDAP server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.14'
    @description = '
    "2.2.14 Ensure LDAP server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database.\nRationale:\nIf the system will not need to act as an LDAP server, it is recommended that the software be disabled to reduce the potential attack surface.\nAudit:\nRun the following commands to verify slapd is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled slapd\ndisabled\n\nRemediation:\nRun the following command to disable slapd : # systemctl --now disable slapd References:\n1. For more detailed documentation on OpenLDAP, go to the project homepage at\nhttp://www.openldap.org.\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_14.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_14.sh"}]
  end
end
