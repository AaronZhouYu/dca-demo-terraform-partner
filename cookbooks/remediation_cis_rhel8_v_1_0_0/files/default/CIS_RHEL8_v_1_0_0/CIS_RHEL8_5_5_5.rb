# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_5')
    @title = 'Ensure default user umask is 027 or more restrictive (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.5'
    @description = '
    "5.5.5 Ensure default user umask is 027 or more restrictive (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe default umask determines the permissions of files created by users. The user creating the file has the discretion of making their files and directories readable by others via the chmod command. Users who wish to \nallow their files and directories to be readable by others by default may choose a different default umask by inserting the umask command into the standard shell configuration files ( .profile , .bashrc , etc.) in \ntheir home directories.\nRationale:\nSetting a very secure default value for umask ensures that users make a conscious choice about their file permissions. A default umask setting of 077 causes files and directories created by users to not be readable \nby any other user on the system. A umask of 027 would make files and directories readable by users in the same Unix group, while a umask of 022 would make files readable by every user on the system.\nAudit:\nRun the following commands and verify all umask lines returned are 027 or more restrictive.\n      # grep \"umask\" /etc/bashrc\numask 027\n# grep \"umask\" /etc/profile /etc/profile.d/*.sh umask 027\n\nRemediation:\nEdit the /etc/bashrc, /etc/profile and /etc/profile.d/*.sh files (and the appropriate files for any other shell supported on your system) and add or edit any umask parameters as follows:\numask 027\nNotes:\nThe audit and remediation in this recommendation apply to bash and shell. If other shells are supported on the system, it is recommended that their configuration files also are checked.\nOther methods of setting a default user umask exist however the shell configuration files are the last run and will override other settings if they exist therefor our recommendation is to configure in the shell \nconfiguration files. If other methods are in use in your environment they should be audited and the shell configs should be verified to not override.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n13 Data Protection Data Protection\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_5.sh"}]
  end
end
