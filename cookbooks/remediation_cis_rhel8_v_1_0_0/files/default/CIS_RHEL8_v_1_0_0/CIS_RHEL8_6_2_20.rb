# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_20 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_20')
    @title = 'Ensure all users home directories exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.20'
    @description = '
    "6.2.20 Ensure all users home directories exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nUsers can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.\nRationale:\nIf the users home directory does not exist or is unassigned, the user will be placed in \"/\" and will not be able to write any files or have local environment variables set.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read -r user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\nfi done\n\nRemediation:\nIf any users home directories do not exist, create them and make sure the respective user owns the directory. Users without an assigned home directory should be removed or assigned a home directory as appropriate.\nNotes:\nThe audit script checks all users with interactive shells except halt, sync, shutdown, and nfsnobody.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nIf any users home directories do not exist, create them and make sure the respective user owns the directory. Users without an assigned home directory should be removed or assigned a home directory as appropriate.'\n"}]
  end
end
