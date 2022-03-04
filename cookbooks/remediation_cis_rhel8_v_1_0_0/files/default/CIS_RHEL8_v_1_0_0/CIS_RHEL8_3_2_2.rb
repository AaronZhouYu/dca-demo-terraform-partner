# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_2')
    @title = 'Ensure ICMP redirects are not accepted (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.2'
    @description = '
    "3.2.2 Ensure ICMP redirects are not accepted (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nICMP redirect messages are packets that convey routing information and tell your host (acting as a router) to send packets via an alternate path. It is a way of allowing an outside routing device to update your \nsystem routing tables. By setting net.ipv4.conf.all.accept_redirects and net.ipv6.conf.all.accept_redirects to 0, the system will not accept any ICMP redirect messages, and therefore, wont allow outsiders to update \nthe systems routing tables.\nRationale:\nAttackers could use bogus ICMP redirect messages to maliciously alter the system routing tables and get them to send packets to incorrect networks and allow your system packets to be captured.\n\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.conf.all.accept_redirects net.ipv4.conf.all.accept_redirects = 0\n# sysctl net.ipv4.conf.default.accept_redirects net.ipv4.conf.default.accept_redirects = 0\n# grep \"net\.ipv4\.conf\.all\.accept_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\n                   net.ipv4.conf.all.accept_redirects= 0\n# grep \"net\.ipv4\.conf\.default\.accept_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv4.conf.default.accept_redirects= 0\n# sysctl net.ipv6.conf.all.accept_redirects\nnet.ipv6.conf.all.accept_redirects = 0\n# sysctl net.ipv6.conf.default.accept_redirects\nnet.ipv6.conf.default.accept_redirects = 0\n# grep \"net\.ipv6\.conf\.all\.accept_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv6.conf.all.accept_redirects= 0\n# grep \"net\.ipv6\.conf\.default\.accept_redirects\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv6.conf.default.accept_redirects= 0\n\nRemediation:\nSet the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:\nRun the following commands to set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      net.ipv4.conf.all.accept_redirects = 0 net.ipv4.conf.default.accept_redirects = 0 net.ipv6.conf.all.accept_redirects = 0 net.ipv6.conf.default.accept_redirects = 0\n               # sysctl -w net.ipv4.conf.all.accept_redirects=0\n# sysctl -w net.ipv4.conf.default.accept_redirects=0 # sysctl -w net.ipv6.conf.all.accept_redirects=0\n       # sysctl -w net.ipv6.conf.default.accept_redirects=0 # sysctl -w net.ipv4.route.flush=1\n# sysctl -w net.ipv6.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_2.sh"}]
  end
end
