# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_3_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_3_4')
    @title = 'Ensure TIPC is disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '3.3.4'
    @description = '
    "3.3.4 Ensure TIPC is disabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe Transparent Inter-Process Communication (TIPC) protocol is designed to provide communication between cluster nodes.\nRationale:\nIf the protocol is not being used, it is recommended that kernel module not be loaded, disabling the service to reduce the potential attack surface.\nAudit:\nRun the following commands and verify the output is as indicated:\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/tipc.conf\nand add the following line:\ninstall tipc /bin/true\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # modprobe -n -v tipc\ninstall /bin/true\n# lsmod | grep tipc\n<No output>\n\n"
    '
    @script_file = 'CIS_RHEL8_3_3_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_3_4.sh"}]
  end
end
