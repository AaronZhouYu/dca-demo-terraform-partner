# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_5_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_5_1')
    @title = 'Ensure permissions on bootloader config are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.5.1'
    @description = '
    "1.5.1 Ensure permissions on bootloader config are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe grub configuration file contains information on boot settings and passwords for unlocking boot options.\nThe grub configuration is usually grub.cfg and grubenv stored in/boot/grub2/` Rationale:\nSetting the permissions to read and write for root only prevents non-root users from seeing the boot parameters or changing them. Non-root users who read the boot parameters may be able to identify weaknesses in \nsecurity upon boot and be able to exploit them.\nAudit:\nRun the following commands and verify Uid and Gid are both 0/root and Access does not grant permissions to group or other :\n      # stat /boot/grub2/grub.cfg\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root) # stat /boot/grub2/grubenv\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n\nRemediation:\nRun the following commands to set permissions on your grub configuration:\nNotes:\nThis recommendation is designed around the grub bootloader, if LILO or another bootloader is in use in your environment enact equivalent settings.\nReplace /boot/grub2/grub.cfg and /boot/grub2/grubenv with the appropriate configuration file(s) for your environment\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # chown root:root /boot/grub2/grub.cfg\n# chmod og-rwx /boot/grub2/grub.cfg\n# chown root:root /boot/grub2/grubenv\n# chmod og-rwx /boot/grub2/grubenv\n\n"
    '
    @script_file = 'CIS_RHEL8_1_5_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_5_1.sh"}]
  end
end
