# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_6')
    @title = 'Ensure default deny firewall policy (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.3.6'
    @description = '
    "3.4.3.6 Ensure default deny firewall policy (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nBase chain policy is the default verdict that will be applied to packets reaching the end of the chain.\nRationale:\nThere are two policies: accept (Default) and drop. If the policy is set to accept, the firewall will accept any packet that is not configured to be denied and the packet will continue transversing the network stack.\nIt is easier to white list acceptable usage than to black list unacceptable usage.\nAudit:\nRun the following commands and verify that base chains contain a policy of DROP.\n      # nft list ruleset | grep hook input\ntype filter hook input priority 0; policy drop;\n# nft list ruleset | grep hook forward\ntype filter hook forward priority 0; policy drop; # nft list ruleset | grep hook output\ntype filter hook output priority 0; policy drop;\n\nRemediation:\nRun the following command for the base chains with the input, forward, and output hooks to implement a default DROP policy:\n# nft chain <table family> <table name> <chain name> { policy drop \; }\nExample:\nImpact:\nif configuring nftables over ssh, creating a base chain with a policy of drop will cause loss of connectivity.\nEnsure that a rule allowing ssh has been added to the base chain prior to setting the base chains policy to drop\nDefault Value:\naccept\nReferences:\n1. Manual Page nft\nNotes:\nChanging firewall settings while connected over network can result in being locked out of the system.\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n               # nft chain inet filter input { policy drop \; }\n# nft chain inet filter forward { policy drop \; }\n         # nft chain inet filter output { policy drop \; }\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command for the base chains with the input, forward, and output hooks to implement a default DROP policy:\n# nft chain <table family> <table name> <chain name> { policy drop \; }\n\nExample:\n# nft chain inet filter input { policy drop \; }\n# nft chain inet filter forward { policy drop \; }\n# nft chain inet filter output { policy drop \; }'\n"}]
  end
end
