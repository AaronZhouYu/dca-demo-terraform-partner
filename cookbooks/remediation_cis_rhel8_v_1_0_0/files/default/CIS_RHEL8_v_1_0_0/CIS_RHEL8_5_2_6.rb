# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_6')
    @title = 'Ensure SSH X11 forwarding is disabled (Scored)'
    @scored = true
    @level = 2
    @identifier = '5.2.6'
    @description = '
    "5.2.6 Ensure SSH X11 forwarding is disabled (Scored)\nProfile Applicability:\n Level 1 - Workstation\n Level 2 - Server\nDescription:\nThe X11Forwarding parameter provides the ability to tunnel X11 traffic through the connection to enable remote graphic connections.\nRationale:\nDisable X11 forwarding unless there is an operational requirement to use X11 applications directly. There is a small risk that the remote X11 servers of users who are logged in via SSH with X11 forwarding could be \ncompromised by other users on the X11 server. Note that even if X11 forwarding is disabled, users can always install their own forwarders.\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: X11Forwarding no\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # sshd -T | grep x11forwarding\nX11Forwarding no\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_6.sh"}]
  end
end
