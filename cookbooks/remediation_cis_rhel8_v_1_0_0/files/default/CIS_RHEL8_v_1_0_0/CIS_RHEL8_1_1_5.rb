# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_5')
    @title = 'Ensure noexec option set on /tmp partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.5'
    @description = '
    "1.1.5 Ensure noexec option set on /tmp partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe noexec mount option specifies that the filesystem cannot contain executable binaries.\nRationale:\nSince the /tmp filesystem is only intended for temporary file storage, set this option to ensure that users cannot run executable binaries from /tmp .\nAudit:\nVerify that the noexec option is set if a /tmp partition exists\nRun the following command and verify that nothing is returned:\n# mount | grep -E \s/tmp\s | grep -v noexec\n\nRemediation:\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /tmp :\n# mount -o remount,noexec /tmp\nOR\nEdit /etc/systemd/system/local-fs.target.wants/tmp.mount to add noexec to the /tmp mount options:\nRun the following command to remount /tmp : # mount -o remount,noexec /tmp\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n               [Mount] Options=mode=1777,strictatime,noexec,nodev,nosuid\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /tmp partition. See the fstab(5) manual page for more information.\nRun the following command to remount /tmp:\n# mount -o remount,noexec /tmp\n\nor\n\nEdit /etc/systemd/system/local-fs.target.wants/tmp.mount to add noexec to the /tmp mount options:\n[Mount]\nOptions=mode=1777,strictatime,noexec,nodev,nosuid\n\nRun the following command to remount /tmp:\n# mount -o remount,noexec /tmp'\n"}]
  end
end
