# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_8')
    @title = 'Ensure users own their home directories (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.8'
    @description = '
    "6.2.8 Ensure users own their home directories (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe user home directory is space defined for the particular user to set local environment variables and to store personal files.\nRationale:\nSince the user is accountable for files stored in the user home directory, the user must be the owner of the directory.\nAudit:\nRun the following script and verify no results are returned:\n      #!/bin/bash\ngrep -E -v ^(halt|sync|shutdown) /etc/passwd | awk -F: ($7 != \"\"$(which nologin)\"\" && $7 != \"/bin/false\") { print $1 \" \" $6 } | while read user dir; do\nif [ ! -d \"$dir\" ]; then\necho \"The home directory ($dir) of user $user does not exist.\"\n  else\n   owner=$(stat -L -c \"%U\" \"$dir\")\n   if [ \"$owner\" != \"$user\" ]; then\necho \"The home directory ($dir) of user $user is owned by $owner.\" fi\nfi done\n\nRemediation:\nChange the ownership of any home directories that are not owned by the defined user to the correct user.\nNotes:\nOn some distributions the /sbin/nologin should be replaced with /usr/sbin/nologin.\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nChange the ownership of any home directories that are not owned by the defined user to the correct user.'\n"}]
  end
end
