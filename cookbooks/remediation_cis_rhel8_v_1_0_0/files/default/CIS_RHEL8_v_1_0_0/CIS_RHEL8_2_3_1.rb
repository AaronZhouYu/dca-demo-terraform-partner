# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_2_3_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_2_3_1')
    @title = 'Ensure NIS Client is not installed (Scored)'
    @scored = true
    @level = 1
    @identifier = '2.3.1'
    @description = '
    "2.3.1 Ensure NIS Client is not installed (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe Network Information Service (NIS), formerly known as Yellow Pages, is a client-server directory service protocol used to distribute system configuration files. The NIS client ( ypbind ) was used to bind a machine \nto an NIS server and receive the distributed configuration files.\nRationale:\nThe NIS service is inherently an insecure system that has been vulnerable to DOS attacks, buffer overflows and has poor authentication for querying NIS maps. NIS generally has been replaced by such protocols as \nLightweight Directory Access Protocol (LDAP). It is recommended that the service be removed.\nAudit:\nVerify ypbind is not installed. Run the following command:\n      # rpm -q ypbind\npackage ypbind is not installed\n\nRemediation:\nRun the following command to Uninstall ypbind # dnf remove ypbind\nImpact:\nMany insecure service clients are used as troubleshooting tools and in testing environments. Uninstalling them can inhibit capability to test and troubleshoot. If they are required it is advisable to remove the \nclients after use to prevent accidental or intentional misuse.\nCIS Controls:\nVersion 7\n2.6 Address unapproved software\nEnsure that unauthorized software is either removed or the inventory is updated in a timely manner\n\n"
    '
    @script_file = 'CIS_RHEL8_2_3_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_2_3_1.sh"}]
  end
end
