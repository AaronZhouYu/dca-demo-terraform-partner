# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_2')
    @title = 'Ensure SELinux is not disabled in bootloader configuration (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.2'
    @description = '
    "1.7.1.2 Ensure SELinux is not disabled in bootloader configuration (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nConfigure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.\nRationale:\nSELinux must be enabled at boot time in your grub configuration to ensure that the controls it provides are not overridden.\nAudit:\nRun the following command and verify that no linux line has the selinux=0 or enforcing=0 parameters set:\nNothing should be returned\n      # grep -E kernelopts=(\S+\s+)*(selinux=0|enforcing=0)+\b /boot/grub2/grubenv\n\nRemediation:\nEdit /etc/default/grub and remove all instances of selinux=0 and enforcing=0 from all CMDLINE_LINUX parameters:\nRun the following command to update the grub2 configuration:\n# grub2-mkconfig -o /boot/grub2/grub.cfg\nNotes:\nThis recommendation is designed around the grub 2 bootloader, if LILO or another bootloader is in use in your environment enact equivalent settings.\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n      GRUB_CMDLINE_LINUX_DEFAULT=\"quiet\" GRUB_CMDLINE_LINUX=\"\"\n\n"
    '
    @script_file = 'CIS_RHEL8_1_7_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_7_1_2.sh"}]
  end
end
