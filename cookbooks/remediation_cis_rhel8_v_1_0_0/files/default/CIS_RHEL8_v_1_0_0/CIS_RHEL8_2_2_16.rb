# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_16 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_16')
    @title = 'Ensure CUPS is not enabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '2.2.16'
    @description = '
    "2.2.16 Ensure CUPS is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 2 - Workstation\nDescription:\nThe Common Unix Print System (CUPS) provides the ability to print to both local and network printers. A system running CUPS can also accept print jobs from remote systems and print them to local printers. It also \nprovides a web based remote administration capability.\nRationale:\nIf the system does not need to print jobs or accept print jobs from other systems, it is recommended that CUPS be disabled to reduce the potential attack surface.\nAudit:\nRun the following command to verify cups is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled cups\ndisabled\n\nRemediation:\nRun the following command to disable cups:\n# systemctl --now disable cups\nImpact:\nDisabling CUPS will prevent printing from the system, a common task for workstation systems.\nReferences:\n1. More detailed documentation on CUPS is available at the project homepage at\nhttp://www.cups.org.\nNotes:\nAdditional methods of disabling a service exist. Consult your distribution documentation for appropriate methods.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_16.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_16.sh"}]
  end
end
