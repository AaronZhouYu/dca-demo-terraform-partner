# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_7_1_1 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_7_1_1')
    @title = 'Ensure SELinux is installed (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.7.1.1'
    @description = '
    "1.7.1.1 Ensure SELinux is installed (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nSELinux provides Mandatory Access Control.\nRationale:\nWithout a Mandatory Access Control system installed only the default Discretionary Access Control system will be available.\nAudit:\nVerify SELinux is installed. Run the following command:\nRemediation:\nRun the following command to install SELinux: # dnf install libselinux\nCIS Controls:\nVersion 7\n14.6 Protect Information through Access Control Lists\nProtect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals \nshould have access to the information based on their need to access the information as a part of their responsibilities.\n      # rpm -q libselinux\nlibselinux-<version>\n\n"
    '
    @script_file = 'CIS_RHEL8_1_7_1_1.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_7_1_1.sh"}]
  end
end
