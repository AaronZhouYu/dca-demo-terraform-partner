# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_3_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_3_3')
    @title = 'Ensure RDS is disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '3.3.3'
    @description = '
    "3.3.3 Ensure RDS is disabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide low-latency, high-bandwidth communications between cluster nodes. It was developed by the Oracle Corporation.\nRationale:\nIf the protocol is not being used, it is recommended that kernel module not be loaded, disabling the service to reduce the potential attack surface.\nAudit:\nRun the following commands and verify the output is as indicated:\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/rds.conf\nand add the following line:\ninstall rds /bin/true\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # modprobe -n -v rds\ninstall /bin/true\n# lsmod | grep rds\n<No output>\n\n"
    '
    @script_file = 'CIS_RHEL8_3_3_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_3_3.sh"}]
  end
end
