# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_6')
    @title = 'Ensure separate partition exists for /var (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.6'
    @description = '
    "1.1.6 Ensure separate partition exists for /var (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe /var directory is used by daemons and other system services to temporarily store dynamic data. Some directories created by these processes may be world-writable.\nRationale:\nSince the /var directory may contain world-writable files and directories, there is a risk of resource exhaustion if it is not bound to a separate partition.\nAudit:\nRun the following command and verify output shows /var is mounted:\n      # mount | grep -E \s/var\s\n/dev/xvdg1 on /var type xfs (rw,relatime,data=ordered)\n\nRemediation:\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var .\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.\nImpact:\nResizing filesystems is a common activity in cloud-hosted servers. Separate filesystem partitions may prevent successful resizing, or may require the installation of additional tools solely for the purpose of \nresizing operations. The use of these additional tools may introduce their own security considerations.\nReferences:\n1. AJ Lewis, \"LVM HOWTO\", http://tldp.org/HOWTO/LVM-HOWTO/ Notes:\nWhen modifying /var it is advisable to bring the system to emergency mode (so auditd is not running), rename the existing directory, mount the new file system, and migrate the data over before returning to multiuser \nmode.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var.\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.'\n"}]
  end
end
