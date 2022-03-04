# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_4')
    @title = 'Ensure suspicious packets are logged (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.4'
    @description = '
    "3.2.4 Ensure suspicious packets are logged (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nWhen enabled, this feature logs packets with un-routable source addresses to the kernel log.\nRationale:\nEnabling this feature and logging these packets allows an administrator to investigate the possibility that an attacker is sending spoofed packets to their system.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.conf.all.log_martians\nnet.ipv4.conf.all.log_martians = 1\n# sysctl net.ipv4.conf.default.log_martians\nnet.ipv4.conf.default.log_martians = 1\n# grep \"net\.ipv4\.conf\.all\.log_martians\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv4.conf.all.log_martians = 1\n# grep \"net\.ipv4\.conf\.default\.log_martians\" /etc/sysctl.conf /etc/sysctl.d/*\nnet.ipv4.conf.default.log_martians = 1\n\nRemediation:\nSet the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:\nRun the following commands to set the active kernel parameters:\nCIS Controls:\nVersion 7\n6.2 Activate audit logging\nEnsure that local logging has been enabled on all systems and networking devices.\n6.3 Enable Detailed Logging\nEnable system logging to include detailed information such as an event source, date, user, timestamp, source addresses, destination addresses, and other useful elements.\n      net.ipv4.conf.all.log_martians = 1 net.ipv4.conf.default.log_martians = 1\n           # sysctl -w net.ipv4.conf.all.log_martians=1\n# sysctl -w net.ipv4.conf.default.log_martians=1 # sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_4.sh"}]
  end
end
