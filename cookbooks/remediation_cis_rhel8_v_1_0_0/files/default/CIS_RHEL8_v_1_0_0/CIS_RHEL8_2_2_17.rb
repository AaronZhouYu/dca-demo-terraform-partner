# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_17 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_17')
    @title = 'Ensure NIS Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.17'
    @description = '
    "2.2.17 Ensure NIS Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Network Information Service (NIS) (formally known as Yellow Pages) is a client-server directory service protocol for distributing system configuration files. The NIS server is a collection of programs that allow \nfor the distribution of configuration files.\nRationale:\nThe NIS service is inherently an insecure system that has been vulnerable to DOS attacks, buffer overflows and has poor authentication for querying NIS maps. NIS generally has been replaced by such protocols as \nLightweight Directory Access Protocol (LDAP). It is recommended that the service be disabled and other, more secure services be used\nAudit:\nRun the following command to verify ypserv is not enabled:\nVerify result is not \"enabled\"\n      # systemctl is-enabled ypserv\ndisabled\n\nRemediation:\nRun the following command to disable ypserv:\n# systemctl --now disable ypserv\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_17.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_17.sh"}]
  end
end
