# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_9 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_9')
    @title = 'Ensure SSH HostbasedAuthentication is disabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.9'
    @description = '
    "5.2.9 Ensure SSH HostbasedAuthentication is disabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts, or /etc/hosts.equiv, along with successful public key client host authentication. This \noption only applies to SSH Protocol Version 2.\nRationale:\nEven though the .rhosts files are ineffective if support is disabled in /etc/pam.conf, disabling the ability to use .rhosts files in SSH provides an additional layer of protection.\nAudit:\nRun the following command and verify that output matches:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set the parameter as follows: HostbasedAuthentication no\nDefault Value:\nHostbasedAuthentication no\nCIS Controls:\nVersion 7\n16.3 Require Multi-factor Authentication\nRequire multi-factor authentication for all user accounts, on all systems, whether managed onsite or by a third-party provider.\n      # sshd -T | grep hostbasedauthentication\nHostbasedAuthentication no\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_9.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_9.sh"}]
  end
end
