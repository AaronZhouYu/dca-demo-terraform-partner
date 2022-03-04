# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_6')
    @title = 'Ensure HTTP Proxy Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.6'
    @description = '
    "2.2.6 Ensure HTTP Proxy Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSquid is a standard proxy server used in many distributions and environments.\nRationale:\nIf there is no need for a proxy server, it is recommended that the squid proxy be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify squid is not enabled:\nVerify result is not \"enabled\"\nRemediation:\nRun the following command to disable squid:\n# systemctl --now disable squid\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # systemctl is-enabled squid\ndisabled\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_6.sh"}]
  end
end
