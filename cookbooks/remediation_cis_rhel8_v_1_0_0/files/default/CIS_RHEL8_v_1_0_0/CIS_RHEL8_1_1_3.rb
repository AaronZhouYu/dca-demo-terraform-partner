# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_3')
    @title = 'Ensure nodev option set on /tmp partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.3'
    @description = '
    "1.1.3 Ensure nodev option set on /tmp partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nodev mount option specifies that the filesystem cannot contain special devices.\nRationale:\nSince the /tmp filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices in /tmp .\nAudit:\nVerify that the nodev option is set if a /tmp partition exists\nRun the following command and verify that nothing is returned:\n# mount | grep -E \s/tmp\s | grep -v nodev\n\nRemediation:\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /tmp :\n# mount -o remount,nodev /tmp\nOR\nEdit /etc/systemd/system/local-fs.target.wants/tmp.mount to add nodev to the /tmp mount options:\nRun the following command to remount /tmp : # mount -o remount,nodev /tmp\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n               [Mount] Options=mode=1777,strictatime,noexec,nodev,nosuid\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /tmp:\n# mount -o remount,nodev /tmp\n\nOR\n\nEdit /etc/systemd/system/local-fs.target.wants/tmp.mount to add nodev to the /tmp mount options:\n[Mount]\nOptions=mode=1777,strictatime,noexec,nodev,nosuid\n\nRun the following command to remount /tmp:\n# mount -o remount,nodev /tmp'\n"}]
  end
end
