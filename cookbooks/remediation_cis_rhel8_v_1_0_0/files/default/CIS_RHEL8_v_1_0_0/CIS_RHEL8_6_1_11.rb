# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_11')
    @title = 'Ensure no unowned files or directories exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.11'
    @description = '
    "6.1.11 Ensure no unowned files or directories exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system.\nRationale:\nA new user who is assigned the deleted users user 6.1.11 or group 6.1.11 may then end up \"owning\" these files, and thus have more access on the system than was intended.\nAudit:\nRun the following command and verify no files are returned:\nThe command above only searches local filesystems, there may still be compromised items on network mounted partitions. Additionally the --local option to df is not universal to all versions, it can be omitted to \nsearch all filesystems on a system including network mounted filesystems or the following command can be run manually for each partition:\n# find <partition> -xdev -nouser\n      # df --local -P | awk {if (NR!=1) print $6} | xargs -I {} find {} -xdev -nouser\n\nRemediation:\nLocate files that are owned by users or groups not listed in the system configuration files, and reset the ownership of these files to some active user on the system as appropriate.\nCIS Controls:\nVersion 7\n13.2 Remove Sensitive Data or Systems Not Regularly Accessed by Organization\nRemove sensitive data or systems not regularly accessed by the organization from the network. These systems shall only be used as stand alone systems (disconnected from the network) by the business unit needing to \noccasionally use the system or completely virtualized and powered off until needed.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nLocate files that are owned by users or groups not listed in the system configuration files, and reset the ownership of these files to some active user on the system as appropriate.'\n"}]
  end
end
