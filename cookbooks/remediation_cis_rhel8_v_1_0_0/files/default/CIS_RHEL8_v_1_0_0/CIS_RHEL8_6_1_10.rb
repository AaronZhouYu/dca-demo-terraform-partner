# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_10 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_10')
    @title = 'Ensure no world writable files exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.10'
    @description = '
    "6.1.10 Ensure no world writable files exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nUnix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2) man page for more information.\nRationale:\nData in world-writable files can be modified and compromised by any user on the system. World writable files may also indicate an incorrectly written script or program that could potentially be the cause of a larger \ncompromise to the systems integrity.\nAudit:\nRun the following command and verify no files are returned:\nThe command above only searches local filesystems, there may still be compromised items on network mounted partitions. Additionally the --local option to df is not universal to all versions, it can be omitted to \nsearch all filesystems on a system including network mounted filesystems or the following command can be run manually for each partition:\n# find <partition> -xdev -type f -perm -0002\n      # df --local -P | awk {if (NR!=1) print $6} | xargs -I {} find {} -xdev -type f -perm -0002\n\nRemediation:\nRemoving write access for the \"other\" category ( chmod o-w <filename> ) is advisable, but always consult relevant vendor documentation to avoid breaking any application dependencies on a given file.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n13 Data Protection Data Protection\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRemoving write access for the \"other\" category ( chmod o-w <filename> ) is advisable, but always consult relevant vendor documentation to avoid breaking any application dependencies on a given file.'\n"}]
  end
end
