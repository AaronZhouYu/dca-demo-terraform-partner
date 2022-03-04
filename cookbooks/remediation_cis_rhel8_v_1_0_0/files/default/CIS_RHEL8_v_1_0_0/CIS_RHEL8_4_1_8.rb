# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_8')
    @title = 'Ensure events that modify the systems network environment are collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.8'
    @description = '
    "4.1.8 Ensure events that modify the systems network environment are collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nRecord changes to network environment files or system calls. The below parameters monitor the sethostname (set the systems host name) or setdomainname (set the systems domainname) system calls, and write an audit \nevent on system call exit. The other parameters monitor the /etc/issue and /etc/issue.net files (messages displayed pre- login), /etc/hosts (file containing host names and associated IP addresses) and \n/etc/sysconfig/network (directory containing network interface scripts and configurations) files.\nRationale:\nMonitoring sethostname and setdomainname will identify potential unauthorized changes to host and domainname of a system. The changing of these names could potentially break security parameters that are set based on \nthose names. The /etc/hosts file is monitored for changes in the file that can indicate an unauthorized intruder is trying to change machine associations with IP addresses and trick users and processes into \nconnecting to unintended machines. Monitoring /etc/issue and /etc/issue.net is important, as intruders could put disinformation into those files and trick users into providing information to the intruder. Monitoring \n/etc/sysconfig/network is important as it can show if network interfaces or scripts are being modified in a way that can lead to the machine becoming unavailable or compromised. All audit records will be tagged with \nthe identifier \"system-locale.\"\n\nAudit:\nRun the following commands:\nVerify output of both matches:\nRemediation:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules Example: vi /etc/audit/rules.d/system-locale.rules\nand add the following lines:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n5.5 Implement Automated Configuration Monitoring Systems\nUtilize a Security Content Automation Protocol (SCAP) compliant configuration monitoring system to verify all security configuration elements, catalog approved exceptions, and alert when unauthorized changes occur.\n      # grep system-locale /etc/audit/rules.d/*.rules # auditctl -l | grep system-locale\n           -a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale -w /etc/issue -p wa -k system-locale\n       -w /etc/issue.net -p wa -k system-locale\n-w /etc/hosts -p wa -k system-locale\n-w /etc/sysconfig/network -p wa -k system-locale\n             -a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale -w /etc/issue -p wa -k system-locale\n-w /etc/issue.net -p wa -k system-locale\n-w /etc/hosts -p wa -k system-locale\n-w /etc/sysconfig/network -p wa -k system-locale\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_8.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_8.sh"}]
  end
end
