# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_6_1_5 < CISRemediation
  def initialize
    super('CIS_RHEL8_6_1_5')
    @title = 'Ensure permissions on /etc/gshadow are configured (Scored)'
    @scored = true
    @level = 1
    @identifier = '6.1.5'
    @description = '
    "6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/gshadow file is used to store the information about groups that is critical to the security of those accounts, such as the hashed password and other security information.\nRationale:\nIf attackers can gain read access to the /etc/gshadow file, they can easily run a password cracking program against the hashed password to break it. Other security information that is stored in the /etc/gshadow file \n(such as group administrators) could also be useful to subvert the group.\nAudit:\nRun the following command and verify Uid is 0/root, Gid is 0/root or <gid>/shadow, and Access is 640 or more restrictive:\nRemediation:\nRun the one of the following chown commands as appropriate and the chmod to set permissions on /etc/gshadow :\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n      # stat /etc/gshadow\nAccess: (0640/-rw-r-----) Uid: ( 0/ root) Gid: ( 0/ root)\n           # chown root:root /etc/gshadow\n# chown root:shadow /etc/gshadow\n# chmod o-rwx,g-rw /etc/gshadow\n\n"
    '
    @script_file = 'CIS_RHEL8_6_1_5.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_6_1_5.sh"}]
  end
end
