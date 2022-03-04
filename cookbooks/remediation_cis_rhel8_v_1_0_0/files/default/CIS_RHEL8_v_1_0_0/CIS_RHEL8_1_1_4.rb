# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_4')
    @title = 'Ensure nosuid option set on /tmp partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.4'
    @description = '
    "1.1.4 Ensure nosuid option set on /tmp partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nosuid mount option specifies that the filesystem cannot contain setuid files.\nRationale:\nSince the /tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot create setuid files in /tmp .\nAudit:\nVerify that the nosuid option is set if a /tmp partition exists\nRun the following command and verify that nothing is returned:\n# mount | grep -E \s/tmp\s | grep -v nosuid\n\nRemediation:\nEdit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /tmp :\n# mount -o remount,nosuid /tmp\nOR\nEdit /etc/systemd/system/local-fs.target.wants/tmp.mount to add nosuid to the /tmp mount options:\nRun the following command to remount /tmp : # mount -o remount,nosuid /tmp\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n               [Mount] Options=mode=1777,strictatime,noexec,nodev,nosuid\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /tmp:\n# mount -o remount,nosuid /tmp\n\nor\n\nEdit /etc/systemd/system/local-fs.target.wants/tmp.mount to add nosuid to the /tmp mount options:\n[Mount]\nOptions=mode=1777,strictatime,noexec,nodev,nosuid\n\nRun the following command to remount /tmp:\n# mount -o remount,nosuid /tmp'\n"}]
  end
end
