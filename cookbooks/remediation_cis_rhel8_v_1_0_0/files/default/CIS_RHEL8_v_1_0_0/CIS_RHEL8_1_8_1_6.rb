# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_8_1_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_8_1_6')
    @title = 'Ensure permissions on /etc/issue.net are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.8.1.6'
    @description = '
    "1.8.1.6 Ensure permissions on /etc/issue.net are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.\nRationale:\nIf the /etc/issue.net file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access is 644 :\nRemediation:\nRun the following commands to set permissions on /etc/issue.net :\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # stat /etc/issue.net\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)\n             # chown root:root /etc/issue.net\n# chmod u-x,go-wx /etc/issue.net\n\n"
    '
    @script_file = 'CIS_RHEL8_1_8_1_6.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_8_1_6.sh"}]
  end
end
