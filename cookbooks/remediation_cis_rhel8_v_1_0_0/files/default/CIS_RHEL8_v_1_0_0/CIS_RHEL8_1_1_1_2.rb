# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_1_2')
    @title = 'Ensure mounting of vFAT filesystems is limited (Not Scored)'
    @scored = false
    @level = 2
    @identifier = '1.1.1.2'
    @description = '
    "1.1.1.2 Ensure mounting of vFAT filesystems is limited (Not Scored)\nProfile Applicability:\n Level 2 - Workstation  Level 2 - Server Description:\nThe vFAT filesystem format is primarily used on older windows systems and portable USB drives or flash modules. It comes in three types FAT12 , FAT16 , and FAT32 all of which are supported by the vfat kernel module.\nRationale:\nRemoving support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it.\nAudit:\nIf utilizing UEFI the vFAT filesystem format is required. If this case, ensure that the vFAT filesystem is only used where appropriate\nRun the following command\ngrep -E -i \svfat\s /etc/fstab\nAnd review that any output is appropriate for your environment If not utilizing UEFI\nRun the following commands and verify the output is as indicated:\n               # modprobe -n -v vfat\ninstall /bin/true\n# lsmod | grep vfat\n           <No output>\n\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/vfat.conf\ninstall vfat /bin/true\nRun the following command to unload the vfat module:\n# rmmod vfat\nImpact:\nThe FAT filesystem format is used by UEFI systems for the EFI boot partition. Disabling the vfat module can prevent boot on UEFI systems.\nFAT filesystems are often used on portable USB sticks and other flash media which are commonly used to transfer files between workstations, removing VFAT support may prevent the ability to transfer files in this way.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_1_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_1_1_2.sh"}]
  end
end
