# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_12 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_12')
    @title = 'Ensure users .netrc Files are not group or world accessible (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.12'
    @description = '
    "6.2.12 Ensure users .netrc Files are not group or world accessible (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nWhile the system administrator can establish secure permissions for users .netrc files, the users can easily override these.\nRationale:\n.netrcfiles may contain unencrypted passwords that may be used to attack other systems.\n\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(root|halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\n  else\n    for file in $dir/.netrc; do\n      if [ ! -h \"$file\" -a -f \"$file\" ]; then\n                             fileperm=$(ls -ld $file | cut -f1 -d\" \")\n        if [ $(echo $fileperm | cut -c5)  != \"-\" ]; then\n          echo \"Group Read set on $file\"\n        fi\n        if [ $(echo $fileperm | cut -c6)  != \"-\" ]; then\n          echo \"Group Write set on $file\"\n        fi\n        if [ $(echo $fileperm | cut -c7)  != \"-\" ]; then\n          echo \"Group Execute set on $file\"\n        fi\n        if [ $(echo $fileperm | cut -c8)  != \"-\" ]; then\n          echo \"Other Read set on $file\"\n        fi\n        if [ $(echo $fileperm | cut -c9)  != \"-\" ]; then\n          echo \"Other Write set on $file\"\n        fi\n        if [ $(echo $fileperm | cut -c10)  != \"-\" ]; then\n          echo \"Other Execute set on $file\"\nfi fi\ndone fi\ndone\n\nRemediation:\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user \n.netrc file permissions and determine the action to be taken in accordance with site policy.\nNotes:\nWhile the complete removal of .netrc files is recommended if any are required on the system secure permissions must be applied.\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .netrc file permissions and determine the action to be taken in accordance with site policy.'\n"}]
  end
end
