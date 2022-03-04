# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_3')
    @title = 'Ensure base chains exist (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.3.3'
    @description = '
    "3.4.3.3 Ensure base chains exist (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nChains are containers for rules. They exist in two kinds, base chains and regular chains. A base chain is an entry point for packets from the networking stack, a regular chain may be used as jump target and is used \nfor better rule organization.\nRationale:\nIf a base chain doesnt exist with a hook for input, forward, and delete, packets that would flow through those chains will not be touched by nftables.\nAudit:\nRun the following commands and verify that base chains exist for INPUT, FORWARD, and OUTPUT.\n      # nft list ruleset | grep hook input\ntype filter hook input priority 0;\n# nft list ruleset | grep hook forward\ntype filter hook forward priority 0;\n# nft list ruleset | grep hook output\ntype filter hook output priority 0;\n\nRemediation:\nRun the following command to create the base chains:\nExample:\nImpact:\nif configuring nftables over ssh, creating a base chain with a policy of drop will cause loss of connectivity.\nEnsure that a rule allowing ssh has been added to the base chain prior to setting the base chains policy to drop\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n      # nft create chain inet <table name> <base chain name> { type filter hook <(input|forward|output)> priority 0 \; }\n           # nft create chain inet filter input { type filter hook input priority 0 \; }\n# nft create chain inet filter forward { type filter hook forward priority 0 \; }\n           # nft create chain inet filter output { type filter hook output priority 0 \; }\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_3_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_3_3.sh"}]
  end
end
