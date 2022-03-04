# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_9 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_9')
    @title = 'Ensure nosuid option set on /var/tmp partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.9'
    @description = '
    "1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nosuid mount option specifies that the filesystem cannot contain setuid files.\nRationale:\nSince the /var/tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot create setuid files in /var/tmp .\nAudit:\nVerify that the nosuid option is set if a /var/tmp partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/var/tmp\s | grep -v nosuid\nRemediation:\nEdit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /var/tmp:\n# mount -o remount,nosuid /var/tmp\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information.\n\nRun the following command to remount /var/tmp:\n# mount -o remount,nosuid /var/tmp'\n"}]
  end
end
