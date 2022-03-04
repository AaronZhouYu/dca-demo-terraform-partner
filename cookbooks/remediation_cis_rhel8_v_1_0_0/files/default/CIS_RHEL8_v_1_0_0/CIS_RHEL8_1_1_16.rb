# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_16 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_16')
    @title = 'Ensure nosuid option set on /dev/shm partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.16'
    @description = '
    "1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nosuid mount option specifies that the filesystem cannot contain setuid files.\nRationale:\nSetting this option on a file system prevents users from introducing privileged programs onto the system and allowing non-root users to execute them.\nAudit:\nVerify that the nosuid option is set if a /dev/shm partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/dev/shm\s | grep -v nosuid\n\nRemediation:\nEdit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /dev/shm partition. See the fstab(5) manual page for more information.\nRun the following command to remount /dev/shm :\n# mount -o remount,nosuid /dev/shm\nNotes:\nSome distributions mount /dev/shm through other means and require /dev/shm to be added to /etc/fstab even though it is already being mounted on boot. Others may configure /dev/shm in other locations and may override \n/etc/fstab configuration. Consult the documentation appropriate for your distribution.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /dev/shm partition. See the fstab(5) manual page for more information.\n\nRun the following command to remount /dev/shm:\n# mount -o remount,nosuid /dev/shm'\n"}]
  end
end
