# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_4_3_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_4_3_2')
    @title = 'Ensure a table exists (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.4.3.2'
    @description = '
    "3.4.3.2 Ensure a table exists (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nTables hold chains. Each table only has one address family and only applies to packets of this family. Tables can have one of five families.\nRationale:\nnftables doesnt have any default tables. Without a table being build, nftables will not filter network traffic.\nAudit:\nRun the following command to verify that a nftables table exists:\n# nft list tables\nReturn should include a list of nftables: example:\ntable inet filter\n\nRemediation:\nRun the following command to create a table in nftables\n# nft create table inet <table name>\nExample:\n# nft create table inet filter\nImpact:\nAdding rules to a running nftables can cause loss of connectivity to the system\nCIS Controls:\nVersion 7\n9.4 Apply Host-based Firewalls or Port Filtering\nApply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.\n\n"
    '
    @script_file = 'CIS_RHEL8_3_4_3_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_4_3_2.sh"}]
  end
end
