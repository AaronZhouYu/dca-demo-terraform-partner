# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_13 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_13')
    @title = 'Ensure no users have .rhosts files (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.13'
    @description = '
    "6.2.13 Ensure no users have .rhosts files (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nWhile no .rhosts files are shipped by default, users can easily create them. Rationale:\nThis action is only meaningful if .rhosts support is permitted in the file /etc/pam.conf . Even though the .rhosts files are ineffective if support is disabled in /etc/pam.conf , they may have been brought over from \nother systems and could contain information useful to an attacker for those other systems.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(root|halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\n  else\n    for file in $dir/.rhosts; do\n      if [ ! -h \"$file\" -a -f \"$file\" ]; then\n        echo \".rhosts file in $dir\"\nfi done\nfi done\n\nRemediation:\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user \n.rhosts files and determine the action to be taken in accordance with site policy.\nNotes:\nOn some distributions the /sbin/nologin should be replaced with /usr/sbin/nologin.\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .rhosts files and determine the action to be taken in accordance with site policy.'\n"}]
  end
end
