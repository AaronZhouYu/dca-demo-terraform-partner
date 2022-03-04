# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_10 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_10')
    @title = 'Ensure noexec option set on /var/tmp partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.10'
    @description = '
    "1.1.10 Ensure noexec option set on /var/tmp partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe noexec mount option specifies that the filesystem cannot contain executable binaries.\nRationale:\nSince the /var/tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot run executable binaries from /var/tmp .\nAudit:\nVerify that the noexec option is set if a /var/tmp partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/var/tmp\s | grep -v noexec\nRemediation:\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /var/tmp :\n# mount -o remount,noexec /var/tmp\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information.\n\nRun the following command to remount /var/tmp:\n# mount -o remount,noexec /var/tmp'\n"}]
  end
end
