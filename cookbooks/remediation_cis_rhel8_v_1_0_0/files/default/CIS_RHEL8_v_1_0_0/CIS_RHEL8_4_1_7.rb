# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_7')
    @title = 'Ensure events that modify the systems Mandatory Access Controls are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.7'
    @description = '
    "4.1.7 Ensure events that modify the systems Mandatory Access Controls are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor SELinux/AppArmor mandatory access controls. The parameters below monitor any write access (potential additional, deletion or modification of files in the directory) or attribute changes to the /etc/selinux or \n/etc/apparmor and /etc/apparmor.d directories.\nRationale:\nChanges to files in these directories could indicate that an unauthorized user is attempting to modify access controls and change security contexts, leading to a compromise of the system.\nAudit:\nOn systems using SELinux run the following commands:\nVerify output of both matches:\n      # grep MAC-policy /etc/audit/rules.d/*.rules # auditctl -l | grep MAC-policy\n             -w /etc/selinux/ -p wa -k MAC-policy\n-w /usr/share/selinux/ -p wa -k MAC-policy\n\nRemediation:\nOn systems using SELinux Edit or create a file in the /etc/audit/rules.d/ directory ending in .rules\nExample: vi /etc/audit/rules.d/MAC-policy.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n5.5 Implement Automated Configuration Monitoring Systems\nUtilize a Security Content Automation Protocol (SCAP) compliant configuration monitoring system to verify all security configuration elements, catalog approved exceptions, and alert when unauthorized changes occur.\n      -w /etc/selinux/ -p wa -k MAC-policy\n-w /usr/share/selinux/ -p wa -k MAC-policy\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_7.sh"}]
  end
end
