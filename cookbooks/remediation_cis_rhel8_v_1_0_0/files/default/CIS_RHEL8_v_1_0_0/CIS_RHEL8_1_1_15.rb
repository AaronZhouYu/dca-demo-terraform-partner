# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_15 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_15')
    @title = 'Ensure nodev option set on /dev/shm partition (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.15'
    @description = '
    "1.1.15 Ensure nodev option set on /dev/shm partition (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nodev mount option specifies that the filesystem cannot contain special devices.\nRationale:\nSince the /dev/shm filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create special devices in /dev/shm partitions.\nAudit:\nVerify that the nodev option is set if a /dev/shm partition exists. Run the following command and verify that nothing is returned:\n# mount | grep -E \s/dev/shm\s | grep -v nodev\n\nRemediation:\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /dev/shm partition. See the fstab(5) manual page for more information.\nRun the following command to remount /dev/shm :\n# mount -o remount,nodev /dev/shm\nNotes:\nSome distributions mount /dev/shm through other means and require /dev/shm to be added to /etc/fstab even though it is already being mounted on boot. Others may configure /dev/shm in other locations and may override \n/etc/fstab configuration. Consult the documentation appropriate for your distribution.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /dev/shm partition. See the fstab(5) manual page for more information.\n\nRun the following command to remount /dev/shm:\n# mount -o remount,nodev /dev/shm'\n"}]
  end
end
