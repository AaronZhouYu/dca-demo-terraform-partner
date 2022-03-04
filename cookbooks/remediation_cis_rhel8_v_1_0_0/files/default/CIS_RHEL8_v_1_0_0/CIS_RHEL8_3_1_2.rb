# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_1_2')
    @title = 'Ensure packet redirect sending is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.1.2'
    @description = '
    "3.1.2 Ensure packet redirect sending is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nICMP Redirects are used to send routing information to other hosts. As a host itself does not act as a router (in a host only configuration), there is no need to send redirects.\nRationale:\nAn attacker could use a compromised host to send invalid ICMP redirects to other router devices in an attempt to corrupt routing and have users access a system set up by the attacker as opposed to a valid system.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.conf.all.send_redirects\nnet.ipv4.conf.all.send_redirects = 0\n# sysctl net.ipv4.conf.default.send_redirects\nnet.ipv4.conf.default.send_redirects = 0\n# grep \"net\.ipv4\.conf\.all\.send_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv4.conf.all.send_redirects = 0\n# grep \"net\.ipv4\.conf\.default\.send_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\n                           net.ipv4.conf.default.send_redirects= 0\n\nRemediation:\nSet the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:\nRun the following commands to set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      net.ipv4.conf.all.send_redirects = 0 net.ipv4.conf.default.send_redirects = 0\n           # sysctl -w net.ipv4.conf.all.send_redirects=0\n# sysctl -w net.ipv4.conf.default.send_redirects=0 # sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_1_2.sh"}]
  end
end
