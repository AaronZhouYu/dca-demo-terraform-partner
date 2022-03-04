# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_4')
    @title = 'Ensure default group for the root account is GID 0 (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.4'
    @description = '
    "5.5.4 Ensure default group for the root account is G5.5.4 0 (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe usermod command can be used to specify which group the root user belongs to. This affects permissions of files that are created by the root user.\nRationale:\nUsing G5.5.4 0 for the root account helps prevent root -owned files from accidentally becoming accessible to non-privileged users.\nAudit:\nRun the following command and verify the result is 0 :\nRemediation:\nRun the following command to set the root user default group to G5.5.4 0 : # usermod -g 0 root\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # grep \"^root:\" /etc/passwd | cut -f4 -d:\n0\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_4.sh"}]
  end
end
