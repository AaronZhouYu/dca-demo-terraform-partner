# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_3')
    @title = 'Ensure permissions on all logfiles are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '4.2.3'
    @description = '
    "4.2.3 Ensure permissions on all logfiles are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nLog files stored in /var/log/ contain logged information from many services on the system, or on log hosts others as well.\nRationale:\nIt is important to ensure that log files have the correct permissions to ensure that sensitive data is archived and protected.\nAudit:\nRun the following command and verify that other has no permissions on any files and group does not have write or execute permissions on any files:\n# find /var/log -type f -perm /037 -ls -o -type d -perm /026 -ls\nNo output should be returned\nRemediation:\nRun the following commands to set permissions on all existing log files:\nNotes:\nYou may also need to change the configuration for your logging software or services for any logs that had incorrect permissions.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n               find /var/log -type f -exec chmod g-wx,o-rwx \"{}\" + -o -type d -exec chmod g- w,o-rwx \"{}\" +\n\n"
    '
    @script_file = 'CIS_RHEL8_4_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_4_2_3.sh"}]
  end
end
