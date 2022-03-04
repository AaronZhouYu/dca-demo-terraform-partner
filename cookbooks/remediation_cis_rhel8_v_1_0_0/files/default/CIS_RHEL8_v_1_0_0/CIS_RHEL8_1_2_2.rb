# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_2_2')
    @title = 'Disable the rhnsd Daemon (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '1.2.2'
    @description = '
    "1.2.2 Disable the rhnsd Daemon  (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe rhnsd daemon polls the Red Hat Network web site for scheduled actions and, if there are, executes those actions.\nRationale:\nPatch management policies may require that organizations test the impact of a patch before it is deployed in a production environment. Having patches automatically deployed could have a negative impact on the \nenvironment. It is best to not allow an action by default but only after appropriate consideration has been made. It is recommended that the service be disabled unless the risk is understood and accepted or you are \nrunning your own satellite . This item is not scored because organizations may have addressed the risk.\nAudit:\nRun the following command and verify the rhnsd service is disabled:\nRemediation:\nRun the following command to disable rhnsd: # systemctl --now disable rhnsd\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      # systemctl is-enabled rhnsd\ndisabled\n\n"
    '
    @script_file = 'CIS_RHEL8_1_2_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_2_2.sh"}]
  end
end
