# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_3_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_3_1')
    @title = 'Ensure DCCP is disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '3.3.1'
    @description = '
    "3.3.1 Ensure DCCP is disabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe Datagram Congestion Control Protocol (DCCP) is a transport layer protocol that supports streaming media and telephony. DCCP provides a way to gain access to congestion control, without having to do it at the \napplication layer, but does not provide in- sequence delivery.\nRationale:\nIf the protocol is not required, it is recommended that the drivers not be installed to reduce the potential attack surface.\nAudit:\nRun the following commands and verify the output is as indicated:\nRemediation:\nEdit or create a file in the /etc/modprobe.d/ directory ending in .conf Example: vim /etc/modprobe.d/dccp.conf\nand add the following line:\ninstall dccp /bin/true\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # modprobe -n -v dccp\ninstall /bin/true\n# lsmod | grep dccp\n<No output>\n\n"
    '
    @script_file = 'CIS_RHEL8_3_3_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_3_1.sh"}]
  end
end
