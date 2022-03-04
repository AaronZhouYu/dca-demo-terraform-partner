# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_10 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_10')
    @title = 'Ensure no users have .forward files (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.10'
    @description = '
    "6.2.10 Ensure no users have .forward files (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe .forward file specifies an email address to forward the users mail to. Rationale:\nUse of the .forward file poses a security risk in that sensitive data may be inadvertently transferred outside the organization. The .forward file also poses a risk as it can be used to execute commands that may \nperform unintended actions.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(root|halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\nelse\nif [ ! -h \"$dir/.forward\" -a -f \"$dir/.forward\" ]; then\necho \".forward file $dir/.forward exists\" fi\nfi done\n\nRemediation:\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user \n.forward files and determine the action to be taken in accordance with site policy.\nNotes:\nOn some distributions the /sbin/nologin should be replaced with /usr/sbin/nologin.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nMaking global modifications to users files without alerting the user community can result in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring policy be established to report user .forward files and determine the action to be taken in accordance with site policy.'\n"}]
  end
end
