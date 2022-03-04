# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_2')
    @title = 'Ensure permissions on /etc/passwd are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.2'
    @description = '
    "6.1.2 Ensure permissions on /etc/passwd are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate.\nRationale:\nIt is critical to ensure that the /etc/passwd file is protected from unauthorized write access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious \nactions.\nAudit:\nRun the following command and verify Uid and Gid are both 0/root and Access is 644 :\nRemediation:\nRun the following command to set permissions on /etc/passwd :\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n      # stat /etc/passwd\nAccess: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/passwd\n# chmod 644 /etc/passwd\n\n"
    '
    @script_file = 'CIS_RHEL8_6_1_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_1_2.sh"}]
  end
end
