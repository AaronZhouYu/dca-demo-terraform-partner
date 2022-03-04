# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_17 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_17')
    @title = 'Ensure noexec option set on /dev/shm partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.17'
    @description = '
    "1.1.17 Ensure noexec option set on /dev/shm partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe noexec mount option specifies that the filesystem cannot contain executable binaries.\nRationale:\nSetting this option on a file system prevents users from executing programs from shared memory. This deters users from introducing potentially malicious software on the system.\nAudit:\nVerify that the noexec option is set if a /dev/shm partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/dev/shm\s | grep -v noexec\n\nRemediation:\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /dev/shm partition. See the fstab(5) manual page for more information.\nRun the following command to remount /dev/shm:\n# mount -o remount,noexec /dev/shm\nNotes:\nSome distributions mount /dev/shm through other means and require /dev/shm to be added to /etc/fstab even though it is already being mounted on boot. Others may configure /dev/shm in other locations and may override \n/etc/fstab configuration. Consult the documentation appropriate for your distribution.\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add noexec to the fourth field (mounting options) for the /dev/shm partition. See the fstab(5) manual page for more information.\n\nRun the following command to remount /dev/shm:\n# mount -o remount,noexec /dev/shm'\n"}]
  end
end
