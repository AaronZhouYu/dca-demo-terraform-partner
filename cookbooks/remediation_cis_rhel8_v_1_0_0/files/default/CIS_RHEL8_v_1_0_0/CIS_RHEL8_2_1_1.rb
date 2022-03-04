# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_1_1')
    @title = 'Ensure xinetd is not installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.1.1'
    @description = '
    "2.1.1 Ensure xinetd is not installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced the original inetd daemon. The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly \nrespond to service requests.\nRationale:\nIf there are no xinetd services required, it is recommended that the package be removed.\nAudit:\nRun the following command to verify xinetd is not installed:\nRemediation:\nRun the following command to remove xinetd: # dnf remove xinetd\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # rpm -q xinetd\npackage xinetd is not installed\n\n"
    '
    @script_file = 'CIS_RHEL8_2_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_1_1.sh"}]
  end
end
