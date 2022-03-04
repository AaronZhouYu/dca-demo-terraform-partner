# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_4')
    @title = 'Ensure loopback traffic is configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.3.4'
    @description = '
    "3.4.3.4 Ensure loopback traffic is configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nConfigure the loopback interface to accept traffic. Configure all other interfaces to deny traffic to the loopback network\nRationale:\nLoopback traffic is generated between processes on machine and is typically critical to operation of the system. The loopback interface is the only place that loopback network traffic should be seen, all other \ninterfaces should ignore traffic on this network as an anti- spoofing measure.\nAudit:\nRun the following commands to verify that the loopback interface is configured:\n      # nft list ruleset | awk /hook input/,/}/ | grep iif \"lo\" accept iif \"lo\" accept\n# nft list ruleset | awk /hook input/,/}/ | grep ip sddr\nip saddr 127.0.0.0/8 counter packets 0 bytes 0 drop\n# nft list ruleset | awk /hook input/,/}/ | grep ip6 saddr ip6 saddr ::1 counter packets 0 bytes 0 drop\n\nRemediation:\nRun the following commands to implement the loopback rules:\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n19.4 Devise Organization-wide Standards for Reporting Incidents\nDevise organization-wide standards for the time required for system administrators and other workforce members to report anomalous events to the incident handling team, the mechanisms for such reporting, and the kind \nof information that should be included in the incident notification.\n      # nft add rule inet filter input iif lo accept\n# nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop # nft add rule inet filter input ip6 saddr ::1 counter drop\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_3_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_3_4.sh"}]
  end
end
