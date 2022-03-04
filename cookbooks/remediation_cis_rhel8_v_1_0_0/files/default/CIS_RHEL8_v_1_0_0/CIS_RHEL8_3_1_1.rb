# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_1_1')
    @title = 'Ensure IP forwarding is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.1.1'
    @description = '
    "3.1.1 Ensure IP forwarding is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe net.ipv4.ip_forward and net.ipv6.conf.all.forwarding flags are used to tell the system whether it can forward packets or not.\nRationale:\nSetting the flags to 0 ensures that a system with multiple interfaces (for example, a hard proxy), will never be able to forward packets, and therefore, never serve as a router.\nAudit:\nRun the following command and verify output matches:\n      # sysctl net.ipv4.ip_forward\nnet.ipv4.ip_forward = 0\n# grep -E -s \"^\s*net\.ipv4\.ip_forward\s*=\s*1\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\nNo value should be returned\n# sysctl net.ipv6.conf.all.forwarding\nnet.ipv6.conf.all.forwarding = 0\n# grep -E -s \"^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*1\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\nNo value should be returned\n\nRemediation:\nRun the following commands to restore the default parameters and set the active kernel parameters:\n      # grep -Els \"^\s*net\.ipv4\.ip_forward\s*=\s*1\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri \n\"s/^\s*(net\.ipv4\.ip_forward\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/\" $filename; done; sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1\n# grep -Els \"^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*1\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri\n                 \"s/^\s*(net\.ipv6\.conf\.all\.forwarding\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/\" $filename; done; sysctl -w net.ipv6.conf.all.forwarding=0; sysctl -w net.ipv6.route.flush=1\n       CIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_1_1.sh"}]
  end
end
