# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_2_13 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_2_13')
    @title = 'Ensure RPC is not enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.2.13'
    @description = '
    "2.2.13 Ensure RPC is not enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe rpcbind service maps Remote Procedure Call (RPC) services to the ports on which they listen. RPC processes notify rpcbind when they start, registering the ports they are listening on and the RPC program numbers \nthey expect to serve. The client system then contacts rpcbind on the server with a particular RPC program number. The rpcbind service redirects the client to the proper port number so it can communicate with the \nrequested service.\nRationale:\nIf the system does not require rpc based services, it is recommended that rpcbind be disabled to reduce the remote attack surface.\nAudit:\nRun the following command to verify rpcbind is not enabled:\nVerify result is not \"enabled\".\n      # systemctl is-enabled rpcbind\ndisabled\n\nRemediation:\nRun the following commands to disable rpcbind :\n# systemctl --now disable rpcbind\nImpact:\nBecause RPC-based services rely on rpcbind to make all connections with incoming client requests, rpcbind must be available before any of these services start\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n\n"
    '
    @script_file = 'CIS_RHEL8_2_2_13.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_2_13.sh"}]
  end
end
