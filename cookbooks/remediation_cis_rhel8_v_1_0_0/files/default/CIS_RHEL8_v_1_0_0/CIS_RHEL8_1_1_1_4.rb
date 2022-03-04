# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_1_1_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_1_1_4')
    @title = 'Ensure mounting of udf filesystems is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.1.1.4'
    @description = '
    "1.1.1.4 Ensure mounting of udf filesystems is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications. This is an open vendor filesystem type for data storage on a broad range of media. This filesystem \ntype is necessary to support writing DVDs and newer optical disc formats.\nRationale:\nRemoving support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it.\nAudit:\nRun the following commands and verify the output is as indicated:\n     # modprobe -n -v udf\ninstall /bin/true\n# lsmod | grep udf\n<No output>\n\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/udf.conf\nand add the following line:\ninstall udf /bin/true\nRun the following command to unload the udf module: # rmmod udf\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_1_1_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_1_1_4.sh"}]
  end
end
