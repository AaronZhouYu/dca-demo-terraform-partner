# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_21 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_21')
    @title = 'Ensure sticky bit is set on all world-writable directories (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.21'
    @description = '
    "1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSetting the sticky bit on world writable directories prevents users from deleting or renaming files in that directory that are not owned by them.\nRationale:\nThis feature prevents the ability to delete or rename files in world writable directories (such as /tmp ) that are owned by another user.\nAudit:\nRun the following command to verify no world writable directories exist without the sticky bit set:\nNo output should be returned.\nRemediation:\nRun the following command to set the sticky bit on all world writable directories:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # df --local -P | awk {if (NR!=1) print $6} | xargs -I {} find {} -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null\n           # df --local -P | awk {if (NR!=1) print $6} | xargs -I {} find {} -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I {} chmod a+t {}\n\n"
    '
    @script_file = 'CIS_RHEL8_1_1_21.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_1_21.sh"}]
  end
end
