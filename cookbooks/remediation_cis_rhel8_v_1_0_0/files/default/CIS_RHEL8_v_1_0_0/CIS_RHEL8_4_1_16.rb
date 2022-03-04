# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_16 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_16')
    @title = 'Ensure system administrator actions (sudolog) are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.16'
    @description = '
    "4.1.16 Ensure system administrator actions (sudolog) are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor the sudo log file. If the system has been properly configured to disable the use of the su command and force all administrators to have to log in first and then use sudo to execute privileged commands, then \nall administrator commands will be logged to /var/log/sudo.log . Any time a command is executed, an audit event will be triggered as the /var/log/sudo.log file will be opened for write and the executed administration \ncommand will be written to the log.\nRationale:\nChanges in /var/log/sudo.log indicate that an administrator has executed a command or the log file itself has been tampered with. Administrators will want to correlate the events written to the audit trail with the \nrecords written to /var/log/sudo.log to verify if unauthorized commands have been executed.\nAudit:\nRun the following commands:\nVerify output of both matches the output of the following command, and the the output includes a file path\nExample Output\n-w /var/log/sudo.log -p wa -k actions\n      # grep -E \"^\s*-w\s+$(grep -r logfile /etc/sudoers* | sed -e s/.*logfile=//;s/,? .*//)\s+-p\s+wa\s+-k\s+actions\" /etc/audit/rules.d/*.rules\n# auditctl -l | grep actions\n                 echo \"-w $(grep -r logfile /etc/sudoers* | sed -e s/.*logfile=//;s/,? .*//) -p wa -k actions\"\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules and add the following line:\n-w <Path to sudo logfile> -p wa -k actions\nExample: vi /etc/audit/rules.d/audit.rules and add the following line:\n-w /var/log/sudo.log -p wa -k actions\nNotes:\nThe system must be configured with sudisabled (See Item 5.6 Ensure access to the su command is restricted) to force all command execution through sudo. This will not be effective on the console, as administrators can \nlog in as root.\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n4.9 Log and Alert on Unsuccessful Administrative Account Login\nConfigure systems to issue a log entry and alert on unsuccessful logins to an administrative account.\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_16.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_16.sh"}]
  end
end
