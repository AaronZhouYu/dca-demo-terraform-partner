# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_3')
    @title = 'Ensure permissions on /etc/shadow are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.3'
    @description = '
    "6.1.3 Ensure permissions on /etc/shadow are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts, such as the hashed password and other security information.\nRationale:\nIf attackers can gain read access to the /etc/shadow file, they can easily run a password cracking program against the hashed password to break it. Other security information that is stored in the /etc/shadow file \n(such as expiration) could also be useful to subvert the user accounts.\nAudit:\nRun the following command and verify verify Uid is 0/root, Gid is 0/root or <gid>/shadow, and Access is 640 or more restrictive:\nRemediation:\nRun the one of the following chown commands as appropriate and the chmod to set permissions on /etc/shadow :\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n      # stat /etc/shadow\nAccess: (0640/-rw-r-----) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/shadow\n# chown root:shadow /etc/shadow\n       # chmod o-rwx,g-wx /etc/shadow\n\n"
    '
    @script_file = 'CIS_RHEL8_6_1_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_1_3.sh"}]
  end
end
