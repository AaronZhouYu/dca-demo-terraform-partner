# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_6')
    @title = 'Disable IPv6 (Not Scored)'
    @scored = false
    @level = 2
    @identifier = '3.6'
    @description = '
    "3.6 Disable IPv6 (Not Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nAlthough IPv6 has many advantages over IPv4, not all organizations have IPv6 or dual stack configurations implemented.\nRationale:\nIf IPv6 or dual stack is not to be used, it is recommended that IPv6 be disabled to reduce the attack surface of the system.\nAudit:\nRun the following command to verify\nOutput should include\nipv6.disable=1\nRemediation:\nEdit /etc/default/grub and add ipv6.disable=1 to the GRUB_CMDLINE_LINUX parameters: GRUB_CMDLINE_LINUX=\"ipv6.disable=1\"\nRun the following command to update the grub2 configuration:\n# grub2-mkconfig o /boot/grub2/grub.cfg\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # grep -E \"^\s*kernelopts=(\S+\s+)*ipv6\.disable=1\b\s*(\S+\s*)*$\" /boot/grub2/grubenv\n\n"
    '
    @script_file = 'CIS_RHEL8_3_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_6.sh"}]
  end
end
