# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_5_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_5_2')
    @title = 'Ensure bootloader password is set (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.5.2'
    @description = '
    "1.5.2 Ensure bootloader password is set (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSetting the boot loader password will require that anyone rebooting the system must enter a password before being able to set command line boot parameters\nRationale:\nRequiring a boot password upon execution of the boot loader will prevent an unauthorized user from entering boot parameters or changing the boot partition. This prevents users from weakening security (e.g. turning \noff SELinux at boot time).\nAudit:\nRun the following command:\nRemediation:\nCreate an encrypted password with grub2-setpassword :\nRun the following command to update the grub2 configuration: # grub2-mkconfig -o /boot/grub2/grub.cfg\n      # grep \"^\s*GRUB2_PASSWORD\" /boot/grub2/user.cfg GRUB2_PASSWORD=<encrypted-password>\n             # grub2-setpassword\nEnter password: <password>\nConfirm password: <password>\n\nImpact:\nIf password protection is enabled, only the designated superuser can edit a Grub 2 menu item by pressing \"e\" or access the GRUB 2 command line by pressing \"c\"\nIf GRUB 2 is set up to boot automatically to a password-protected menu entry the user has no option to back out of the password prompt to select another menu entry. Holding the SHIFT key will not display the menu in \nthis case. The user must enter the correct username and password. If unable, the configuration files will have to be edited via the LiveCD or other means to fix the problem\nYou can add --unrestricted to the menu entries to allow the system to boot without entering a password. Password will still be required to edit menu items.\nNotes:\nThis recommendation is designed around the grub2 bootloader, if LILO or another bootloader is in use in your environment enact equivalent settings.\nReplace `/boot/grub2/grub.cfg with the appropriate grub configuration file for your environment\nThe superuser/user information and password do not have to be contained in the /etc/grub.d/00_header file. The information can be placed in any /etc/grub.d file as long as that file is incorporated into grub.cfg. The \nuser may prefer to enter this data into a custom file, such as /etc/grub.d/40_custom so it is not overwritten should the Grub package be updated. If placing the information in a custom file, do not include the \"cat \n<< EOF\" and \"EOF\" lines as the content is automatically added from these files.\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_5_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_5_2.sh"}]
  end
end
