# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_18 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_18')
    @title = 'Ensure nodev option set on removable media partitions (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '1.1.18'
    @description = '
    "1.1.18 Ensure nodev option set on removable media partitions (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nodev mount option specifies that the filesystem cannot contain special devices. Rationale:\nRemovable media containing character and block special devices could be used to circumvent security controls by allowing non-root users to access sensitive device files such as /dev/kmem or the raw disk partitions.\nAudit:\nRun the following command and verify that the nodev option is set on all removable media partitions.\n# mount\nRemediation:\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) of all removable media partitions. Look for entries that have mount points that contain words such as floppy or cdrom. See the fstab(5) \nmanual page for more information.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) of all removable media partitions. Look for entries that have mount points that contain words such as floppy or cdrom. See the fstab(5) manual page for more information.'\n"}]
  end
end
