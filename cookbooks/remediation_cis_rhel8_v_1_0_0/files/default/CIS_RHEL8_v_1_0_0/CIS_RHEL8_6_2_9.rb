# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_9 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_9')
    @title = 'Ensure users dot files are not group or world writable (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.9'
    @description = '
    "6.2.9 Ensure users dot files are not group or world writable (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nWhile the system administrator can establish secure permissions for users \"dot\" files, the users can easily override these.\nRationale:\nGroup or world-writable user configuration files may enable malicious users to steal or modify other users data or to gain another users system privileges.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\n  else\n    for file in $dir/.[A-Za-z0-9]*; do\n      if [ ! -h \"$file\" -a -f \"$file\" ]; then\n        fileperm=$(ls -ld $file | cut -f1 -d\" \")\nif [ $(echo $fileperm | cut -c6) != \"-\" ]; then echo \"Group Write permission set on file $file\"\n        fi\n        if [ $(echo $fileperm | cut -c9)  != \"-\" ]; then\necho \"Other Write permission set on file $file\" fi\n                                     fi done\nfi done\n\nRemediation:\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user \ndot file permissions and determine the action to be taken in accordance with site policy.\nNotes:\nOn some distributions the /sbin/nologin should be replaced with /usr/sbin/nologin.\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user dot file permissions and determine the action to be taken in accordance with site policy.'\n"}]
  end
end
