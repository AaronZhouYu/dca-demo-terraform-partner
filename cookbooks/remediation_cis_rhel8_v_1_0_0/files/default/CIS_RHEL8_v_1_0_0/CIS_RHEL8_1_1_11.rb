# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_11')
    @title = 'Ensure separate partition exists for /var/log (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.11'
    @description = '
    "1.1.11 Ensure separate partition exists for /var/log (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe /var/log directory is used by system services to store log data .\nRationale:\nThere are two important reasons to ensure that system logs are stored on a separate partition: protection against resource exhaustion (since logs can grow quite large) and protection of audit data.\nAudit:\nRun the following command and verify output shows /var/log is mounted:\n      # mount | grep /var/log\n/dev/xvdh1 on /var/log type xfs (rw,relatime,data=ordered)\n\nRemediation:\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var/log .\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.\nImpact:\nResizing filesystems is a common activity in cloud-hosted servers. Separate filesystem partitions may prevent successful resizing, or may require the installation of additional tools solely for the purpose of \nresizing operations. The use of these additional tools may introduce their own security considerations.\nReferences:\n1. AJ Lewis, \"LVM HOWTO\", http://tldp.org/HOWTO/LVM-HOWTO/ Notes:\nWhen modifying /var/log it is advisable to bring the system to emergency mode (so auditd is not running), rename the existing directory, mount the new file system, and migrate the data over before returning to \nmultiuser mode.\nCIS Controls:\nVersion 7\n6.4 Ensure adequate storage for logs\nEnsure that all systems that store logs have adequate storage space for the logs generated.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var/log.\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.'\n"}]
  end
end
