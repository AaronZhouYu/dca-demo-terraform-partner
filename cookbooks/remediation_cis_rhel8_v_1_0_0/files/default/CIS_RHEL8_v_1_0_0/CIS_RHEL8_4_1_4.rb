# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_4')
    @title = 'Ensure login and logout events are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.4'
    @description = '
    "4.1.4 Ensure login and logout events are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor login and logout events. The parameters below track changes to files associated with login/logout events. The file /var/log/faillog tracks failed events from login. The file /var/log/lastlog maintain records \nof the last time a user successfully logged in.\nRationale:\nMonitoring login/logout events could provide a system administrator with information associated with brute force attacks against user logins.\nAudit:\nRun the following commands:\nVerify output of both includes:\n      # grep logins /etc/audit/rules.d/*.rules # auditctl -l | grep logins\n             -w /var/log/faillog -p wa -k logins\n-w /var/log/lastlog -p wa -k logins\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/audit.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n4.9 Log and Alert on Unsuccessful Administrative Account Login\nConfigure systems to issue a log entry and alert on unsuccessful logins to an administrative account.\n16.13 Alert on Account Login Behavior Deviation\nAlert when users deviate from normal login behavior, such as time-of-day, workstation location and duration.\n      -w /var/log/faillog -p wa -k logins\n-w /var/log/lastlog -p wa -k logins\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_4.sh"}]
  end
end
