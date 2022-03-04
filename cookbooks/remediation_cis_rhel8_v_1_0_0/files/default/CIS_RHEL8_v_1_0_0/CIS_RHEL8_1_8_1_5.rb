# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_8_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_8_1_5')
    @title = 'Ensure permissions on /etc/issue are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.8.1.5'
    @description = '
    "1.8.1.5 Ensure permissions on /etc/issue are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe contents of the /etc/issue file are displayed to users prior to login for local terminals.\nRationale:\nIf the /etc/issue file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access is 644 :\n      # stat /etc/issue\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)\n\nRemediation:\nRun the following commands to set permissions on /etc/issue :\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # chown root:root /etc/issue\n# chmod u-x,go-wx /etc/issue\n\n"
    '
    @script_file = 'CIS_RHEL8_1_8_1_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_8_1_5.sh"}]
  end
end
