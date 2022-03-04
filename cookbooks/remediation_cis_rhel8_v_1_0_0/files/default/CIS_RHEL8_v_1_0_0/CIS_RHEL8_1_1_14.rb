# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_14 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_14')
    @title = 'Ensure nodev option set on /home partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.14'
    @description = '
    "1.1.14 Ensure nodev option set on /home partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nodev mount option specifies that the filesystem cannot contain special devices.\nRationale:\nSince the user partitions are not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices.\nAudit:\nVerify that the nodev option is set if a /home partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/home\s | grep -v nodev\n\nRemediation:\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /home partition. See the fstab(5) manual page for more information.\n# mount -o remount,nodev /home\nNotes:\nThe actions in this recommendation refer to the /homepartition, which is the default user partition that is defined in many distributions. If you have created other user partitions, it is recommended that the \nRemediation and Audit steps be applied to these partitions as well.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /home partition. See the fstab(5) manual page for more information.\n\n# mount -o remount,nodev /home'\n"}]
  end
end
