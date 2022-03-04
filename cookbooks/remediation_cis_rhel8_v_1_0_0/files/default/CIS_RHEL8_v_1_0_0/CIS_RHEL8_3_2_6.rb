# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_6')
    @title = 'Ensure bogus ICMP responses are ignored (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.6'
    @description = '
    "3.2.6 Ensure bogus ICMP responses are ignored (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nSetting icmp_ignore_bogus_error_responses to 1 prevents the kernel from logging bogus responses (RFC-1122 non-compliant) from broadcast reframes, keeping file systems from filling up with useless log messages.\nRationale:\nSome routers (and some attackers) will send responses that violate RFC-1122 and attempt to fill up a log file system with many useless error messages.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.icmp_ignore_bogus_error_responses net.ipv4.icmp_ignore_bogus_error_responses = 1\n# grep -E -s \"^\s*net\.ipv4\.icmp_ignore_bogus_error_responses\s*=\s*0\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\nNothing should be returned\n\nRemediation:\nRun the following commands to restore the default parameters and set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # grep -Els \"^\s*net\.ipv4\.icmp_ignore_bogus_error_responses\s*=\s*0\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri \n\"s/^\s*(net\.ipv4\.icmp_ignore_bogus_error_responses\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/\" $filename; done; sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1; sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_6.sh"}]
  end
end
