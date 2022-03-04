# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_2_3')
    @title = 'Ensure root PATH Integrity (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.2.3'
    @description = '
    "6.2.3 Ensure root PATH Integrity (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe root user can execute any command on the system and could be fooled into executing programs unintentionally if the PATH is not set correctly.\nRationale:\nIncluding the current working directory (.) or other writable directory in root s executable path makes it likely that an attacker can gain superuser access by forcing an administrator operating as root to execute a \nTrojan horse program.\nAudit:\nRun the following script and verify no results are returned:\n      for x in $(echo $PATH | tr \":\" \" \") ; do if [ -d \"$x\" ] ; then\nls -ldH \"$x\" | awk \n$9 == \".\" {print \"PATH contains current working directory (.)\"} $3 != \"root\" {print $9, \"is not owned by root\"}\nsubstr($1,6,1) != \"-\" {print $9, \"is group writable\"} substr($1,9,1) != \"-\" {print $9, \"is world writable\"}\n  else\n    echo \"$x is not a directory\"\nfi done\n                       Remediation:\nCorrect or justify any items discovered in the Audit step.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nCorrect or justify any items discovered in the Audit step.'\n"}]
  end
end
