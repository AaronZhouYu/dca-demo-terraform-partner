# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_1_13 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_1_13')
    @title = 'Ensure use of privileged commands is collected (Scored)'
    @scored = true
    @level = 2
    @identifier = '4.1.13'
    @description = '
    "4.1.13 Ensure use of privileged commands is collected (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nMonitor privileged programs (those that have the setuid and/or setgid bit set on execution) to determine if unprivileged users are running these commands.\nRationale:\nExecution of privileged commands by non-privileged users could be an indication of someone trying to gain unauthorized access to the system.\nAudit:\nRun the following command replacing <partition> with a list of partitions where programs can be executed from on your system:\nVerify all resulting lines are in a .rules file in /etc/audit/rules.d/ and the output of auditctl -l.\nNote: The .rules file output will be auid!=-1 not auid!=4294967295\n      # find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk {print \"-a always,exit -F path=\" $1 \" -F perm=x -F auid>=\"$(awk /^\s*U4.1.13_MIN/{print $2} /etc/login.defs)\" -F auid!=4294967295 -k \nprivileged\" }\n\nRemediation:\nTo remediate this issue, the system administrator will have to execute a find command to locate all the privileged programs and then add an audit line for each one of them. The audit parameters associated with this \nare as follows:\n-F path=\" $1 \" - will populate each file name found through the find command and processed by awk. -F perm=x - will write an audit record if the file is executed. -F auid>=1000 - will write a record if the user \nexecuting the command is not a privileged user. -F auid!= 4294967295 - will ignore Daemon events\nAll audit records should be tagged with the identifier \"privileged\".\nRun the following command replacing with a list of partitions where programs can be executed from on your system:\nEdit or create a file in the /etc/audit/rules.d/ directory ending in .rules and add all resulting lines to the file.\nExample:\nNotes:\nReloading the auditd config to set active settings may require a system reboot.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk {print \"-a always,exit -F path=\" $1 \" -F perm=x -F auid>=\"$(awk /^\s*U4.1.13_MIN/{print $2} /etc/login.defs)\" -F auid!=4294967295 -k \nprivileged\" }\n               # find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk {print \"-a always,exit -F path=\" $1 \" -F perm=x -F auid>=\"$(awk /^\s*U4.1.13_MIN/{print $2} /etc/login.defs)\" -F \nauid!=4294967295 -k privileged\" } >> /etc/audit/rules.d/privileged.rules\n\n"
    '
    @script_file = 'CIS_RHEL8_4_1_13.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_1_13.sh"}]
  end
end
