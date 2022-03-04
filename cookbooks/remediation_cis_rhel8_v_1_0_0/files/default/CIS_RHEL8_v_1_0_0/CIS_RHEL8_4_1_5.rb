# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_5')
    @title = 'Ensure session initiation information is collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.5'
    @description = '
    "4.1.5 Ensure session initiation information is collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor session initiation events. The parameters in this section track changes to the files associated with session events. The file /var/run/utmp tracks all currently logged in users. All audit records will be \ntagged with the identifier \"session.\" The /var/log/wtmp file tracks logins, logouts, shutdown, and reboot events. The file /var/log/btmp keeps track of failed login attempts and can be read by entering the command \n/usr/bin/last -f /var/log/btmp . All audit records will be tagged with the identifier \"logins.\"\nRationale:\nMonitoring these files for changes could alert a system administrator to logins occurring at unusual hours, which could indicate intruder activity (i.e. a user logging in at a time when they do not normally log in).\nAudit:\nRun the following commands:\nVerify output of both includes:\n      # grep -E (session|logins) /etc/audit/rules.d/*.rules # auditctl -l | grep -E (session|logins)\n             -w /var/run/utmp -p wa -k session\n-w /var/log/wtmp -p wa -k logins\n-w /var/log/btmp -p wa -k logins\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/logins.rules\nand add the following lines:\nNotes:\nThe last command can be used to read /var/log/wtmp (last with no parameters) and /var/run/utmp (last -f /var/run/utmp)\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n4.9 Log and Alert on Unsuccessful Administrative Account Login\nConfigure systems to issue a log entry and alert on unsuccessful logins to an administrative account.\n16.13 Alert on Account Login Behavior Deviation\nAlert when users deviate from normal login behavior, such as time-of-day, workstation location and duration.\n      -w /var/run/utmp -p wa -k session\n-w /var/log/wtmp -p wa -k logins\n-w /var/log/btmp -p wa -k logins\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_5.sh"}]
  end
end
