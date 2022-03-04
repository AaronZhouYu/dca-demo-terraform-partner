# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_11')
    @title = 'Ensure events that modify user/group information are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.11'
    @description = '
    "4.1.11 Ensure events that modify user/group information are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nRecord events affecting the group , passwd (user 4.1.11s), shadow and gshadow (passwords) or /etc/security/opasswd (old passwords, based on remember parameter in the PAM configuration) files. The parameters in this \nsection will watch the files to see if they have been opened for write or have had attribute changes (e.g. permissions) and tag them with the identifier \"identity\" in the audit log file.\nRationale:\nUnexpected changes to these files could be an indication that the system has been compromised and that an unauthorized user is attempting to hide their activities or compromise additional accounts.\nAudit:\nRun the following commands:\nVerify output of both matches:\n      # grep identity /etc/audit/rules.d/*.rules # auditctl -l | grep identity\n             -w /etc/group -p wa -k identity\n-w /etc/passwd -p wa -k identity\n-w /etc/gshadow -p wa -k identity\n       -w /etc/shadow -p wa -k identity\n-w /etc/security/opasswd -p wa -k identity\n\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/identity.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n4.8 Log and Alert on Changes to Administrative Group Membership\nConfigure systems to issue a log entry and alert when an account is added to or removed from any group assigned administrative privileges.\n      -w /etc/group -p wa -k identity\n-w /etc/passwd -p wa -k identity\n-w /etc/gshadow -p wa -k identity\n-w /etc/shadow -p wa -k identity\n-w /etc/security/opasswd -p wa -k identity\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_11.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_11.sh"}]
  end
end
