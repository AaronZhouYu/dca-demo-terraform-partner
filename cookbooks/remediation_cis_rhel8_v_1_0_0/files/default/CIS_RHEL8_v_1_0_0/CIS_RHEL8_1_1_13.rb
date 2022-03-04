# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_13 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_13')
    @title = 'Ensure separate partition exists for /home (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.13'
    @description = '
    "1.1.13 Ensure separate partition exists for /home (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe /home directory is used to support disk storage needs of local users. Rationale:\nIf the system is intended to support local users, create a separate partition for the /home directory to protect against resource exhaustion and restrict the type of files that can be stored under /home .\nAudit:\nRun the following command and verify output shows /home is mounted:\n      # mount | grep /home\n/dev/xvdf1 on /home type xfs (rw,nodev,relatime,data=ordered)\n\nRemediation:\nFor new installations, during installation create a custom partition setup and specify a separate partition for /home .\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.\nImpact:\nResizing filesystems is a common activity in cloud-hosted servers. Separate filesystem partitions may prevent successful resizing, or may require the installation of additional tools solely for the purpose of \nresizing operations. The use of these additional tools may introduce their own security considerations.\nReferences:\n1. AJ Lewis, \"LVM HOWTO\", http://tldp.org/HOWTO/LVM-HOWTO/ CIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor new installations, during installation create a custom partition setup and specify a separate partition for /home.\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.'\n"}]
  end
end
