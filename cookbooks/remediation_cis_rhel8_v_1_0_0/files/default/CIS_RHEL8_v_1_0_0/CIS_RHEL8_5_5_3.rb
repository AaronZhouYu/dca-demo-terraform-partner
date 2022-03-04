# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_3')
    @title = 'Ensure default user shell timeout is 900 seconds or less (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.3'
    @description = '
    "5.5.3 Ensure default user shell timeout is 900 seconds or less (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe default TMOUT determines the shell timeout for users. The TMOUT value is measured in seconds.\nRationale:\nHaving no timeout value associated with a shell could allow an unauthorized user access to another users shell session (e.g. user walks away from their computer and doesnt lock the screen). Setting a timeout value \nat least reduces the risk of this happening.\nAudit:\nRun the following commands and verify all TMOUT lines returned are 900 or less and at least one exists in each file.\n      # grep \"^TMOUT\" /etc/bashrc\nreadonly TMOUT=900 ; export TMOUT\n# grep \"^TMOUT\" /etc/profile /etc/profile.d/*.sh readonly TMOUT=900 ; export TMOUT\n\nRemediation:\nEdit the /etc/bashrc, /etc/profile and /etc/profile.d/*.sh files (and the appropriate files for any other shell supported on your system) and add or edit any umask parameters as follows:\nreadonly TMOUT=900 ; export TMOUT\nNote that setting the value to readonly prevents unwanted modification during runtime. Notes:\nThe audit and remediation in this recommendation apply to bash and shell. If other shells are supported on the system, it is recommended that their configuration files also are checked. Other methods of setting a \ntimeout exist for other shells not covered here.\nEnsure that the timeout conforms to your local policy.\nCIS Controls:\nVersion 7\n16.11 Lock Workstation Sessions After Inactivity\nAutomatically lock workstation sessions after a standard period of inactivity.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_3.sh"}]
  end
end
