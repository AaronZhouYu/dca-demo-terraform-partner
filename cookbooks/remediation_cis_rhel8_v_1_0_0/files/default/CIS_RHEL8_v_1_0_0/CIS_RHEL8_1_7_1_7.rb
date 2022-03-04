# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_7')
    @title = 'Ensure the MCS Translation Service (mcstrans) is not installed (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.7'
    @description = '
    "1.7.1.7 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe mcstransd daemon provides category label information to client processes requesting information. The label translations are defined in /etc/selinux/targeted/setrans.conf\nRationale:\nSince this service is not used very often, remove it to reduce the amount of potentially vulnerable code running on the system.\nAudit:\nVerify mcstrans is not installed. Run the following command:\nRemediation:\nRun the following command to uninstall mcstrans: # dnf remove mcstrans\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # rpm -q mcstrans\npackage mcstrans is not installed\n\n\n1.8.1 Command Line Warning Banners\nThe /etc/motd, /etc/issue, and /etc/issue.net files govern warning banners for standard command line logins for both local and remote users.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_7_1_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_7_1_7.sh"}]
  end
end
