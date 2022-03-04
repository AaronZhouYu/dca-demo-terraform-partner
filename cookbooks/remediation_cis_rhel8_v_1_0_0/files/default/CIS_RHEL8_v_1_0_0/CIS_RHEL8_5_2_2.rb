# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_2')
    @title = 'Ensure SSH access is limited (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.2'
    @description = '
    "5.2.2 Ensure SSH access is limited (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThere are several options available to limit which users and group can access the system via SSH. It is recommended that at least one of the following options be leveraged:\nAllowUsers\nThe AllowUsers variable gives the system administrator the option of allowing specific users to ssh into the system. The list consists of space separated user names. Numeric user 5.2.2s are not recognized with this \nvariable. If a system administrator wants to restrict user access further by only allowing the allowed users to log in from a particular host, the entry can be specified in the form of user@host.\nAllowGroups\nThe AllowGroups variable gives the system administrator the option of allowing specific groups of users to ssh into the system. The list consists of space separated group names. Numeric group 5.2.2s are not recognized \nwith this variable.\nDenyUsers\nThe DenyUsers variable gives the system administrator the option of denying specific users to ssh into the system. The list consists of space separated user names. Numeric user 5.2.2s are not recognized with this \nvariable. If a system administrator wants to restrict user access further by specifically denying a users access from a particular host, the entry can be specified in the form of user@host.\nDenyGroups\nThe DenyGroups variable gives the system administrator the option of denying specific groups of users to ssh into the system. The list consists of space separated group names. Numeric group 5.2.2s are not recognized \nwith this variable.\nRationale:\nRestricting which users can remotely access the system via SSH will help ensure that only authorized users access the system.\n\nAudit:\nRun the following command:\nsshd -T | grep -E ^\s*(allow|deny)(users|groups)\s+\S+\nVerify that the output matches at least one of the following lines:\nRemediation:\nEdit the /etc/ssh/sshd_config file to set one or more of the parameter as follows:\nCIS Controls:\nVersion 7\n4.3 Ensure the Use of Dedicated Administrative Accounts\nEnsure that all users with administrative account access use a dedicated or secondary account for elevated activities. This account should only be used for administrative activities and not internet browsing, email, \nor similar activities.\n               AllowUsers <userlist>\nAllowGroups <grouplist>\nDenyUsers <userlist>\nDenyGroups <grouplist>\n               AllowUsers <userlist>\nAllowGroups <grouplist>\nDenyUsers <userlist>\nDenyGroups <grouplist>\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nEdit the /etc/ssh/sshd_config file to set one or more of the parameter as follows:\nAllowUsers <userlist>\nAllowGroups <grouplist>\nDenyUsers <userlist>\nDenyGroups <grouplist>'\n"}]
  end
end
