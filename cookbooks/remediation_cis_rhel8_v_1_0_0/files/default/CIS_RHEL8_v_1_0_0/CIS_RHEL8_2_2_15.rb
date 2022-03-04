# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_15 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_15')
    @title = 'Ensure DHCP Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.15'
    @description = '
    "2.2.15 Ensure DHCP Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses.\nRationale:\nUnless a system is specifically set up to act as a DHCP server, it is recommended that this service be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify dhcpd is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled dhcpd\ndisabled\n\nRemediation:\nRun the following command to disable dhcpd: # systemctl --now disable dhcpd References:\n1. More detailed documentation on DHCP is available at\nhttp://www.isc.org/software/dhcp.\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_15.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_15.sh"}]
  end
end
