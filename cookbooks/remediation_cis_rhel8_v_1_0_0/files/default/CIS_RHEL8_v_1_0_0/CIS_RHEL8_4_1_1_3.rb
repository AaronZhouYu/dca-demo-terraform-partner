# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_1_3')
    @title = 'Ensure auditing for processes that start prior to auditd is enabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.1.3'
    @description = '
    "4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nConfigure grub2 so that processes that are capable of being audited can be audited even if they start up prior to auditd startup.\nRationale:\nAudit events need to be captured on processes that start up prior to auditd , so that potential malicious activity cannot go undetected.\nAudit:\nRun the following command:\n# grep -E kernelopts=(\S+\s+)*audit=1\b /boot/grub2/grubenv\nOutput will include audit=1\n\nRemediation:\nEdit /etc/default/grub and add audit=1 to GRUB_CMDLINE_LINUX: GRUB_CMDLINE_LINUX=\"audit=1\"\nRun the following command to update the grub2 configuration:\n# grub2-mkconfig -o /boot/grub2/grub.cfg\nNotes:\nThis recommendation is designed around the grub2 bootloader, if another bootloader is in use in your environment enact equivalent settings.\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_1_3.sh"}]
  end
end
