# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_8')
    @title = 'Ensure nodev option set on /var/tmp partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.8'
    @description = '
    "1.1.8 Ensure nodev option set on /var/tmp partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nodev mount option specifies that the filesystem cannot contain special devices.\nRationale:\nSince the /var/tmp filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices in /var/tmp .\nAudit:\nVerify that the nodev option is set if a /var/tmp partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/var/tmp\s | grep -v nodev\nRemediation:\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /var/tmp :\n# mount -o remount,nodev /var/tmp\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information.\n\nRun the following command to remount /var/tmp:\n# mount -o remount,nodev /var/tmp'\n"}]
  end
end
