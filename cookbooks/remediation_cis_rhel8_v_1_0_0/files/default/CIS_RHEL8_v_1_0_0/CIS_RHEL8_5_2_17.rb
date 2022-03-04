# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_17 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_17')
    @title = 'Ensure SSH AllowTcpForwarding is disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '5.2.17'
    @description = '
    "5.2.17 Ensure SSH AllowTcpForwarding is disabled (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nSSH port forwarding is a mechanism in SSH for tunneling application ports from the client to the server, or servers to clients. It can be used for adding encryption to legacy applications, going through firewalls, \nand some system administrators and IT professionals use it for opening backdoors into the internal network from their home machines\nRationale:\nLeaving port forwarding enabled can expose the organization to security risks and back- doors.\nSSH connections are protected with strong encryption. This makes their contents invisible to most deployed network monitoring and traffic filtering solutions. This invisibility carries considerable risk potential if \nit is used for malicious purposes such as data exfiltration. Cybercriminals or malware could exploit SSH to hide their unauthorized communications, or to exfiltrate stolen data from the target network\nAudit:\nRun the following command and verify that output matches:\n      # sshd -T | grep -i allowtcpforwarding\nAllowTcpForwarding no\n\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows:\nAllowTcpForwarding no\nImpact:\nSSH tunnels are widely used in many corporate environments that employ mainframe systems as their application backends. In those environments the applications themselves may have very limited native support for \nsecurity. By utilizing tunneling, compliance with SOX, HIPAA, PCI-DSS, and other standards can be achieved without having to modify the applications.\nDefault Value:\nAllowTcpForwarding yes\nReferences:\n1. https://www.ssh.com/ssh/tunneling/example\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_17.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_17.sh"}]
  end
end
