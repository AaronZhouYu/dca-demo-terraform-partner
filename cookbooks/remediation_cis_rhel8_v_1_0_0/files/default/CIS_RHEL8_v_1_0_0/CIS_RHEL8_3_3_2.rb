# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_3_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_3_2')
    @title = 'Ensure SCTP is disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '3.3.2'
    @description = '
    "3.3.2 Ensure SCTP is disabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe Stream Control Transmission Protocol (SCTP) is a transport layer protocol used to support message oriented communication, with several streams of messages in one connection. It serves a similar function as TCP \nand UDP, incorporating features of both. It is message-oriented like UDP, and ensures reliable in-sequence transport of messages with congestion control like TCP.\nRationale:\nIf the protocol is not being used, it is recommended that kernel module not be loaded, disabling the service to reduce the potential attack surface.\nAudit:\nRun the following commands and verify the output is as indicated:\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/sctp.conf\nand add the following line:\ninstall sctp /bin/true\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # modprobe -n -v sctp\ninstall /bin/true\n# lsmod | grep sctp\n<No output>\n\n"
    '
    @script_file = 'CIS_RHEL8_3_3_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_3_2.sh"}]
  end
end
