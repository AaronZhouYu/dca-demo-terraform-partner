# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_1_4')
    @title = 'Ensure audit_backlog_limit is sufficient (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.1.4'
    @description = '
    "4.1.1.4 Ensure audit_backlog_limit is sufficient (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe backlog limit has a default setting of 64\nRationale:\nduring boot if audit=1, then the backlog will hold 64 records. If more that 64 records are created during boot, auditd records will be lost and potential malicious activity could go undetected.\nAudit:\nRun the following command and verify the audit_backlog_limit= parameter is set to an appropriate size for your organization\n# grep -E kernelopts=(\S+\s+)*audit_backlog_limit=\S+\b /boot/grub2/grubenv\nValidate that the line(s) returned contain a value for audit_backlog_limit= and the value is sufficient for your organization.\nRecommended that this value be 8192 or larger.\n\nRemediation:\nEdit /etc/default/grub and add audit_backlog_limit=<BACKLOG SIZE> to GRUB_CMDLINE_LINUX:\nExample:\nGRUB_CMDLINE_LINUX=\"audit_backlog_limit=8192\"\nRun the following command to update the grub2 configuration:\n# grub2-mkconfig -o /boot/grub2/grub.cfg\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_1_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_1_4.sh"}]
  end
end
