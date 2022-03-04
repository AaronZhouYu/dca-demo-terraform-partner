# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_14 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_14')
    @title = 'Audit SGID executables (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '6.1.14'
    @description = '
    "6.1.14 Audit SG6.1.14 executables (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe owner of a file can set the files permissions to run with the owners or groups permissions, even if the user running the program is not the owner or a member of the group. The most common reason for a SG6.1.14 \nprogram is to enable users to perform functions (such as changing their password) that require root privileges.\nRationale:\nThere are valid reasons for SG6.1.14 programs, but it is important to identify and review such programs to ensure they are legitimate. Review the files returned by the action in the audit section and check to see if \nsystem binaries have a different md5 checksum than what from the package. This is an indication that the binary may have been replaced.\nAudit:\nRun the following command to list SG6.1.14 files:\nThe command above only searches local filesystems, there may still be compromised items on network mounted partitions. Additionally the --local option to df is not universal to all versions, it can be omitted to \nsearch all filesystems on a system including network mounted filesystems or the following command can be run manually for each partition:\n# find <partition> -xdev -type f -perm -2000\n      # df --local -P | awk {if (NR!=1) print $6} | xargs -I {} find {} -xdev -type f -perm -2000\n\nRemediation:\nEnsure that no rogue SG6.1.14 programs have been introduced into the system. Review the files returned by the action in the Audit section and confirm the integrity of these binaries.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEnsure that no rogue SG6.1.14 programs have been introduced into the system. Review the files returned by the action in the Audit section and confirm the integrity of these binaries.'\n"}]
  end
end
