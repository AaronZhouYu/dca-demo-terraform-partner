# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_7')
    @title = 'Ensure nftables service is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.3.7'
    @description = '
    "3.4.3.7 Ensure nftables service is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe nftables service allows for the loading of nftables rulesets during boot, or starting of the nftables service\nRationale:\nThe nftables service restores the nftables rules from the rules files referenced in the /etc/sysconfig/nftables.conf file durring boot or the starting of the nftables service\nAudit:\nRun the following command and verify that the nftables service is enabled:\nRemediation:\nRun the following command to enable the nftables service:\n# systemctl --now enable nftables\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # systemctl is-enabled nftables\nenabled\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_3_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_3_7.sh"}]
  end
end
