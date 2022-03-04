# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_12 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_12')
    @title = 'Ensure separate partition exists for /var/log/audit (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.12'
    @description = '
    "1.1.12 Ensure separate partition exists for /var/log/audit (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe auditing daemon, auditd , stores log data in the /var/log/audit directory. Rationale:\nThere are two important reasons to ensure that data gathered by auditd is stored on a separate partition: protection against resource exhaustion (since the audit.log file can grow quite large) and protection of audit \ndata. The audit daemon calculates how much free space is left and performs actions based on the results. If other processes (such as syslog ) consume space in the same partition as auditd , it may not perform as \ndesired.\nAudit:\nRun the following command and verify output shows /var/log/audit is mounted:\n      # mount | grep /var/log/audit\n/dev/xvdi1 on /var/log/audit type xfs (rw,relatime,data=ordered)\n\nRemediation:\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var/log/audit .\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.\nImpact:\nResizing filesystems is a common activity in cloud-hosted servers. Separate filesystem partitions may prevent successful resizing, or may require the installation of additional tools solely for the purpose of \nresizing operations. The use of these additional tools may introduce their own security considerations.\nReferences:\n1. AJ Lewis, \"LVM HOWTO\", http://tldp.org/HOWTO/LVM-HOWTO/ Notes:\nWhen modifying /var/log/audit it is advisable to bring the system to emergency mode (so auditd is not running), rename the existing directory, mount the new file system, and migrate the data over before returning to \nmultiuser mode.\nCIS Controls:\nVersion 7\n6.4 Ensure adequate storage for logs\nEnsure that all systems that store logs have adequate storage space for the logs generated.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var/log/audit.\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.'\n"}]
  end
end
