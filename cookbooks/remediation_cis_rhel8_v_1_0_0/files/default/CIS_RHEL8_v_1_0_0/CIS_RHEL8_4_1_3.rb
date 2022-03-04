# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_3')
    @title = 'Ensure changes to system administration scope (sudoers) is collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.3'
    @description = '
    "4.1.3 Ensure changes to system administration scope (sudoers) is collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor scope changes for system administrations. If the system has been properly configured to force system administrators to log in as themselves first and then use the sudo command to execute privileged commands, \nit is possible to monitor changes in scope. The file /etc/sudoers will be written to when the file or its attributes have changed. The audit records will be tagged with the identifier \"scope.\"\nRationale:\nChanges in the /etc/sudoers file can indicate that an unauthorized change has been made to scope of system administrator activity.\nAudit:\nRun the following commands:\nVerify output of both matches:\n      # grep scope /etc/audit/rules.d/*.rules # auditctl -l | grep scope\n             -w /etc/sudoers -p wa -k scope\n-w /etc/sudoers.d/ -p wa -k scope\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/scope.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n4.8 Log and Alert on Changes to Administrative Group Membership\nConfigure systems to issue a log entry and alert when an account is added to or removed from any group assigned administrative privileges.\n      -w /etc/sudoers -p wa -k scope\n-w /etc/sudoers.d/ -p wa -k scope\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_3.sh"}]
  end
end
