# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_8')
    @title = 'Ensure permissions on /etc/group- are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.8'
    @description = '
    "6.1.8 Ensure permissions on /etc/group- are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/group- file contains a backup list of all the valid groups defined in the system. Rationale:\nIt is critical to ensure that the /etc/group- file is protected from unauthorized access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access is 644 or more restrictive:\nRemediation:\nRun the following command to set permissions on /etc/group- :\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n      # stat /etc/group-\nAccess: (0644/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/group-\n# chmod u-x,go-wx /etc/group-\n\n"
    '
    @script_file = 'CIS_RHEL8_6_1_8.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_1_8.sh"}]
  end
end
