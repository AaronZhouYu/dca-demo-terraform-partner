# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_4')
    @title = 'Ensure the SELinux state is enforcing (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.4'
    @description = '
    "1.7.1.4 Ensure the SELinux state is enforcing (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nSet SELinux to enable when the system is booted.\nRationale:\nSELinux must be enabled at boot time to ensure that the controls it provides are in effect at all times.\nAudit:\nRun the following commands and ensure output matches:\nRemediation:\nEdit the /etc/selinux/config file to set the SELINUX parameter: SELINUX=enforcing\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n      # grep -E ^\s*SELINUX=enforcing /etc/selinux/config SELINUX=enforcing\n# sestatus\nSELinux status: enabled\nCurrent mode: enforcing\nMode from config file: enforcing\n\n"
    '
    @script_file = 'CIS_RHEL8_1_7_1_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_7_1_4.sh"}]
  end
end
