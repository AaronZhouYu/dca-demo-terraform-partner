# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_7')
    @title = 'Ensure separate partition exists for /var/tmp (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.1.7'
    @description = '
    "1.1.7 Ensure separate partition exists for /var/tmp (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe /var/tmp directory is a world-writable directory used for temporary storage by all users and some applications.\nRationale:\nSince the /var/tmp directory is intended to be world-writable, there is a risk of resource exhaustion if it is not bound to a separate partition. In addition, making /var/tmp its own file system allows an \nadministrator to set the noexec option on the mount, making /var/tmp useless for an attacker to install executable code. It would also prevent an attacker from establishing a hardlink to a system setuid program and \nwait for it to be updated. Once the program was updated, the hardlink would be broken and the attacker would have his own copy of the program. If the program happened to have a security vulnerability, the attacker \ncould continue to exploit the known flaw.\nAudit:\nRun the following command and verify output shows /var/tmp is mounted:\n      # mount | grep /var/tmp\n<device> on /var/tmp type xfs (rw,nosuid,nodev,noexec,relatime)\n\nRemediation:\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var/tmp .\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.\nImpact:\nResizing filesystems is a common activity in cloud-hosted servers. Separate filesystem partitions may prevent successful resizing, or may require the installation of additional tools solely for the purpose of \nresizing operations. The use of these additional tools may introduce their own security considerations.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor new installations, during installation create a custom partition setup and specify a separate partition for /var/tmp.\nFor systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.'\n"}]
  end
end
