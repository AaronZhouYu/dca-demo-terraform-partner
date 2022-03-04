# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_14 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_14')
    @title = 'Ensure file deletion events by users are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.14'
    @description = '
    "4.1.14 Ensure file deletion events by users are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor the use of system calls associated with the deletion or renaming of files and file attributes. This configuration statement sets up monitoring for the unlink (remove a file), unlinkat (remove a file \nattribute), rename (rename a file) and renameat (rename a file attribute) system calls and tags them with the identifier \"delete\".\nNote: Systems may have been customized to change the default U4.1.14_MIN. To confirm the U4.1.14_MIN for your system, run the following command:\nawk /^\s*U4.1.14_MIN/{print $2} /etc/login.defs\nIf your systems U4.1.14_MIN is not 1000, replace audit>=1000 with audit>=<U4.1.14_MIN for your system> in the Audit and Remediation procedures.\nRationale:\nMonitoring these calls from non-privileged users could provide a system administrator with evidence that inappropriate removal of files and file attributes associated with protected files is occurring. While this \naudit option will look at all events, system administrators will want to look for specific privileged files that are being deleted or altered.\n\nAudit:\nRun the following commands:\n# grep delete /etc/audit/rules.d/*.rules\nVerify output matches:\nVerify output matches:\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/delete.rules\nand add the following lines:\nNotes:\nAt a minimum, configure the audit system to collect file deletion events for all users and root.\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n13 Data Protection Data Protection\n               -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete\n-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete\n         # auditctl -l | grep delete\n         -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=-1 -k delete\n-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=-1 -k delete\n               -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete\n-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_14.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_14.sh"}]
  end
end
