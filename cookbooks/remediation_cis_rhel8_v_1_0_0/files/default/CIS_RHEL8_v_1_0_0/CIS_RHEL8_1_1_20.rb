# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_20 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_20')
    @title = 'Ensure noexec option set on removable media partitions (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '1.1.20'
    @description = '
    "1.1.20 Ensure noexec option set on removable media partitions (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe noexec mount option specifies that the filesystem cannot contain executable binaries. Rationale:\nSetting this option on a file system prevents users from executing programs from the removable media. This deters users from being able to introduce potentially malicious software on the system.\nAudit:\nRun the following command and verify that the noexec option is set on all removable media partitions.\n# mount\nRemediation:\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) of all removable media partitions. Look for entries that have mount points that contain words such as floppy or cdrom. See the fstab(5) \nmanual page for more information.\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) of all removable media partitions. Look for entries that have mount points that contain words such as floppy or cdrom. See the fstab(5) manual page for more information.'\n"}]
  end
end
