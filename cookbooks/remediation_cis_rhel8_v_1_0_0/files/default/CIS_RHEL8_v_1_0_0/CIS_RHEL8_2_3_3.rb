# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_3_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_3_3')
    @title = 'Ensure LDAP client is not installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.3.3'
    @description = '
    "2.3.3 Ensure LDAP client is not installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database.\nRationale:\nIf the system will not need to act as an LDAP client, it is recommended that the software be removed to reduce the potential attack surface.\nAudit:\nVerify openldap-clients is not installed. Run the following command:\nRemediation:\nRun the following command to uninstall openldap-clients.\n# dnf remove openldap-clients\nImpact:\nRemoving the LDAP client will prevent or inhibit using LDAP for authentication in your environment.\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n      # rpm -q openldap-clients\npackage openldap-clients is not installed\n\n"
    '
    @script_file = 'CIS_RHEL8_2_3_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_3_3.sh"}]
  end
end
