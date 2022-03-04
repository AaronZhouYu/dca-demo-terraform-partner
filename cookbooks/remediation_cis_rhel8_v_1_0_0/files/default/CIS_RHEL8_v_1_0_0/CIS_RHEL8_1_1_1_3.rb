# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_1_3')
    @title = 'Ensure mounting of squashfs filesystems is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.1.3'
    @description = '
    "1.1.1.3 Ensure mounting of squashfs filesystems is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs ). A squashfs image can be used without having to first decompress the image.\nRationale:\nRemoving support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it.\nAudit:\nRun the following commands and verify the output is as indicated:\n      # modprobe -n -v squashfs\ninstall /bin/true\n# lsmod | grep squashfs\n<No output>\n\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/squashfs.conf\nand add the following line:\ninstall squashfs /bin/true\nRun the following command to unload the squashfs module: # rmmod squashfs\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_1_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_1_1_3.sh"}]
  end
end
