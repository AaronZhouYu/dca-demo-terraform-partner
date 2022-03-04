# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_6')
    @title = 'Ensure SETroubleshoot is not installed (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.6'
    @description = '
    "1.7.1.6 Ensure SETroubleshoot is not installed (Scored)\nProfile Applicability:\n Level 2 - Server Description:\nThe SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. The service provides important information around configuration errors, unauthorized intrusions, and other \npotential errors.\nRationale:\nThe SETroubleshoot service is an unnecessary daemon to have running on a server, especially if X Windows is disabled.\nAudit:\nVerify setroubleshoot is not installed. Run the following command:\nRemediation:\nRun the following command to uninstall setroubleshoot: # dnf remove setroubleshoot\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n      # rpm -q setroubleshoot\npackage setroubleshoot is not installed\n\n"
    '
    @script_file = 'CIS_RHEL8_1_7_1_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_7_1_6.sh"}]
  end
end
