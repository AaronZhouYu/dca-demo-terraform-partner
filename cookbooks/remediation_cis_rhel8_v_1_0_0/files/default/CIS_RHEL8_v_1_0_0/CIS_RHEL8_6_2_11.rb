# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_11')
    @title = 'Ensure no users have .netrc files (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.11'
    @description = '
    "6.2.11 Ensure no users have .netrc files (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe .netrc file contains data for logging into a remote host for file transfers via FTP. Rationale:\nThe .netrc file presents a significant security risk since it stores passwords in unencrypted form. Even if FTP is disabled, user accounts may have brought over .netrc files from other systems which could pose a risk \nto those systems.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(root|halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\nelse\nif [ ! -h \"$dir/.netrc\" -a -f \"$dir/.netrc\" ]; then\n      echo \".netrc file $dir/.netrc exists\"\n    fi\nfi done\n\nRemediation:\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user \n.netrc files and determine the action to be taken in accordance with site policy.\nNotes:\nOn some distributions the /sbin/nologin should be replaced with /usr/sbin/nologin.\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .netrc files and determine the action to be taken in accordance with site policy.'\n"}]
  end
end
