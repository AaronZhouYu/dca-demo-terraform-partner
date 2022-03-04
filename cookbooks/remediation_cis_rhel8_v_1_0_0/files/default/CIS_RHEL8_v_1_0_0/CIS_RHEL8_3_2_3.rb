# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_3')
    @title = 'Ensure secure ICMP redirects are not accepted (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.3'
    @description = '
    "3.2.3 Ensure secure ICMP redirects are not accepted (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSecure ICMP redirects are the same as ICMP redirects, except they come from gateways listed on the default gateway list. It is assumed that these gateways are known to your system, and that they are likely to be \nsecure.\nRationale:\nIt is still possible for even known gateways to be compromised. Setting net.ipv4.conf.all.secure_redirects to 0 protects the system from routing table updates by possibly compromised known gateways.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.conf.all.secure_redirects\nnet.ipv4.conf.all.secure_redirects = 0\n# sysctl net.ipv4.conf.default.secure_redirects\nnet.ipv4.conf.default.secure_redirects = 0\n# grep \"net\.ipv4\.conf\.all\.secure_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv4.conf.all.secure_redirects= 0\n# grep \"net\.ipv4\.conf\.default\.secure_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\n                           net.ipv4.conf.default.secure_redirects= 0\n\nRemediation:\nSet the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:\nRun the following commands to set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      net.ipv4.conf.all.secure_redirects = 0 net.ipv4.conf.default.secure_redirects = 0\n           # sysctl -w net.ipv4.conf.all.secure_redirects=0\n# sysctl -w net.ipv4.conf.default.secure_redirects=0 # sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_3.sh"}]
  end
end
