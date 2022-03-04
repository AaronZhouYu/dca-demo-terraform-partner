# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_7 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_7')
    @title = 'Ensure permissions on /etc/shadow- are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.7'
    @description = '
    "6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe /etc/shadow- file is used to store backup information about user accounts that is critical to the security of those accounts, such as the hashed password and other security information.\nRationale:\nIt is critical to ensure that the /etc/shadow- file is protected from unauthorized access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.\nAudit:\nRun the following command and verify verify Uid is 0/root, Gid is 0/root or <gid>/shadow, and Access is 640 or more restrictive:\n      # stat /etc/shadow-\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n\nRemediation:\nRun the one of the following chown commands as appropriate and the chmod to set permissions on /etc/shadow- :\n# chown root:root /etc/shadow-\nOR\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n               # chown root:shadow /etc/shadow-\n# chmod u-x,go-rwx /etc/shadow-\n\n"
    '
    @script_file = 'CIS_RHEL8_6_1_7.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_1_7.sh"}]
  end
end
