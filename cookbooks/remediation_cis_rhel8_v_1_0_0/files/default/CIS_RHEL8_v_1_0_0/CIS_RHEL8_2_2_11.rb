# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_11')
    @title = 'Ensure DNS Server is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.11'
    @description = '
    "2.2.11 Ensure DNS Server is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers, services and other resources connected to a network.\nRationale:\nUnless a system is specifically designated to act as a DNS server, it is recommended that the package be deleted to reduce the potential attack surface.\nAudit:\nRun the following command to verify named is not enabled:\nVerify result is not \"enabled\".\nRemediation:\nRun the following command to disable named :\n# systemctl --now disable named\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # systemctl is-enabled named\ndisabled\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_11.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_11.sh"}]
  end
end
