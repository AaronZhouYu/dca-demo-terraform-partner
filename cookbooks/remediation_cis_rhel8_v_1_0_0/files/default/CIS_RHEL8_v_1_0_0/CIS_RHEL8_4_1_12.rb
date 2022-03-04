# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_12 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_12')
    @title = 'Ensure successful file system mounts are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.12'
    @description = '
    "4.1.12 Ensure successful file system mounts are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation Description:\nMonitor the use of the mount system call. The mount (and umount ) system call controls the mounting and unmounting of file systems. The parameters below configure the system to create an audit record when the mount \nsystem call is used by a non-privileged user\nRationale:\nIt is highly unusual for a non privileged user to mount file systems to the system. While tracking mount commands gives the system administrator evidence that external media may have been mounted (based on a review \nof the source of the mount and confirming its an external media type), it does not conclusively indicate that data was exported to the media. System administrators who wish to determine if data were exported, would \nalso have to track successful open , creat and truncate system calls requiring write access to a file under the mount point of the external media file system. This could give a fair indication that a write occurred. \nThe only way to truly prove it, would be to track successful writes to the external media. Tracking write system calls could quickly fill up the audit log and is not recommended. Recommendations on configuration \noptions to track data export to media is beyond the scope of this document.\nNote: Systems may have been customized to change the default U4.1.12_MIN. To confirm the U4.1.12_MIN for your system, run the following command:\nawk /^\s*U4.1.12_MIN/{print $2} /etc/login.defs\nIf your systems U4.1.12_MIN is not 1000, replace audit>=1000 with audit>=<U4.1.12_MIN for your system> in the Audit and Remediation procedures.\n\nAudit:\nRun the following commands:\n# grep mounts /etc/audit/rules.d/*.rules\nVerify output matches:\nVerify output matches:\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/mounts.rules\nand add the following lines:\nNotes:\nThis tracks successful and unsuccessful mount commands. File system mounts do not have to come from external media and this action still does not verify write (e.g. CD ROMS).\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n               -a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts\n-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts\n         # auditctl -l | grep mounts\n         -a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=-1 -k mounts -a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=-1 -k mounts\n           -a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts\n-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_12.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_12.sh"}]
  end
end
