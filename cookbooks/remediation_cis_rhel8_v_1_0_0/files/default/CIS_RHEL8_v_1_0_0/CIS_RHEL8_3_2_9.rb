# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_9 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_9')
    @title = 'Ensure IPv6 router advertisements are not accepted (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.9'
    @description = '
    "3.2.9 Ensure IPv6 router advertisements are not accepted (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThis setting disables the systems ability to accept IPv6 router advertisements.\nRationale:\nIt is recommended that systems do not accept router advertisements as they could be tricked into routing traffic to compromised machines. Setting hard routes within the system (usually a single default route to a \ntrusted router) protects the system from bad routes.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv6.conf.all.accept_ra\nnet.ipv6.conf.all.accept_ra = 0\n# sysctl net.ipv6.conf.default.accept_ra\nnet.ipv6.conf.default.accept_ra = 0\n# grep \"net\.ipv6\.conf\.all\.accept_ra\" /etc/sysctl.conf /etc/sysctl.d/* net.ipv6.conf.all.accept_ra = 0\n# grep \"net\.ipv6\.conf\.default\.accept_ra\" /etc/sysctl.conf /etc/sysctl.d/* net.ipv6.conf.default.accept_ra = 0\n\nRemediation:\nSet the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:\nRun the following commands to set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      net.ipv6.conf.all.accept_ra = 0\nnet.ipv6.conf.default.accept_ra = 0\n           # sysctl -w net.ipv6.conf.all.accept_ra=0\n# sysctl -w net.ipv6.conf.default.accept_ra=0\n     # sysctl -w net.ipv6.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_9.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_9.sh"}]
  end
end
