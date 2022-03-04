# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_7')
    @title = 'Ensure Reverse Path Filtering is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.7'
    @description = '
    "3.2.7 Ensure Reverse Path Filtering is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nSetting net.ipv4.conf.all.rp_filter and net.ipv4.conf.default.rp_filter to 1 forces the Linux kernel to utilize reverse path filtering on a received packet to determine if the packet was valid. Essentially, with \nreverse path filtering, if the return packet does not go out the same interface that the corresponding source packet came from, the packet is dropped (and logged if log_martians is set).\nRationale:\nSetting these flags is a good way to deter attackers from sending your system bogus packets that cannot be responded to. One instance where this feature breaks down is if asymmetrical routing is employed. This would \noccur when using dynamic routing protocols (bgp, ospf, etc) on your system. If you are using asymmetrical routing on your system, you will not be able to enable this feature without breaking the routing.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl net.ipv4.conf.all.rp_filter\nnet.ipv4.conf.all.rp_filter = 1\n# sysctl net.ipv4.conf.default.rp_filter\nnet.ipv4.conf.default.rp_filter = 1\n# grep -E -s \"^\s*net\.ipv4\.conf\.all\.rp_filter\s*=\s*0\" /etc/sysctl.conf\n               /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\nNothing should be returned\n# grep -E -s \"^\s*net\.ipv4\.conf\.default\.rp_filter\s*=\s*1\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\nnet.ipv4.conf.default.rp_filter = 1\n\nRemediation:\nRun the following command to restore the default net.ipv4.conf.all.rp_filter = 1 parameter and set the active kernel parameter:\nSet the following parameter in /etc/sysctl.conf or a /etc/sysctl.d/* file:\nnet.ipv4.conf.default.rp_filter=1\nRun the following commands to set the active kernel parameter:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # grep -Els \"^\s*net\.ipv4\.conf\.all\.rp_filter\s*=\s*0\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri \n\"s/^\s*(net\.ipv4\.net.ipv4.conf\.all\.rp_filter\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/\" $filename; done; sysctl -w net.ipv4.conf.all.rp_filter=1; sysctl -w net.ipv4.route.flush=1\n                            # sysctl -w net.ipv4.conf.default.rp_filter=1 # sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_7.sh"}]
  end
end
