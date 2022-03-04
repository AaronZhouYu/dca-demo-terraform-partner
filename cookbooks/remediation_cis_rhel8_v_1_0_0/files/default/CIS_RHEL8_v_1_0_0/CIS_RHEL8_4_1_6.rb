# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_6')
    @title = 'Ensure events that modify date and time information are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.6'
    @description = '
    "4.1.6 Ensure events that modify date and time information are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nCapture events where the system date and/or time has been modified. The parameters in this section are set to determine if the adjtimex (tune kernel clock), settimeofday (Set time, using timeval and timezone \nstructures) stime (using seconds since 1/1/1970) or clock_settime (allows for the setting of several internal clocks and timers) system calls have been executed and always write an audit record to the \n/var/log/audit.log file upon exit, tagging the records with the identifier \"time-change\"\nRationale:\nUnexpected changes in system date and/or time could be a sign of malicious activity on the system.\nAudit:\nRun the following commands:\nVerify output of both matches:\n      # grep time-change /etc/audit/rules.d/*.rules # auditctl -l | grep time-change\n           -a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change\n-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time- change\n       -a always,exit -F arch=b64 -S clock_settime -k time-change -a always,exit -F arch=b32 -S clock_settime -k time-change -w /etc/localtime -p wa -k time-change\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/time-change.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n5.5 Implement Automated Configuration Monitoring Systems\nUtilize a Security Content Automation Protocol (SCAP) compliant configuration monitoring system to verify all security configuration elements, catalog approved exceptions, and alert when unauthorized changes occur.\n      -a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change\n-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time- change\n-a always,exit -F arch=b64 -S clock_settime -k time-change\n-a always,exit -F arch=b32 -S clock_settime -k time-change\n-w /etc/localtime -p wa -k time-change\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_6.sh"}]
  end
end
