# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_5_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_5_2')
    @title = 'Ensure system accounts are secured (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.5.2'
    @description = '
    "5.5.2 Ensure system accounts are secured (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThere are a number of accounts provided with most distributions that are used to manage applications and are not intended to provide an interactive shell.\nRationale:\nIt is important to make sure that accounts that are not being used by regular users are prevented from being used to provide an interactive shell. By default, most distributions set the password field for these \naccounts to an invalid string, but it is also recommended that the shell field in the password file be set to the nologin shell. This prevents the account from potentially being used to run any commands.\nAudit:\nRun the following commands and verify no results are returned:\n      awk -F: ($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $1!~/^\+/ && $3<\"$(awk /^\s*U5.5.2_MIN/{print $2} /etc/login.defs)\" && $7!=\"\"$(which nologin)\"\" && $7!=\"/bin/false\") {print} /etc/passwd\nawk -F: ($1!=\"root\" && $1!~/^\+/ && $3<\"$(awk /^\s*U5.5.2_MIN/{print $2} /etc/login.defs)\") {print $1} /etc/passwd | xargs -I {} passwd -S {} | awk ($2!=\"L\" && $2!=\"LK\") {print $1}\n\nRemediation:\nRun the commands appropriate for your distribution:\nSet the shell for any accounts returned by the audit to nologin:\n# usermod -s $(which nologin) <user>\nLock any non root accounts returned by the audit:\n# usermod -L <user>\nThe following command will set all system accounts to a non login shell:\nThe following command will automatically lock not root system accounts:\nNotes:\nThe root, sync, shutdown, and halt users are exempted from requiring a non-login shell.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n                        awk -F: ($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $1!~/^\+/ && $3<\"$(awk /^\s*U5.5.2_MIN/{print $2} /etc/login.defs)\" && $7!=\"\"$(which nologin)\"\" && $7!=\"/bin/false\") \n{print $1} /etc/passwd | while read user do usermod -s $(which nologin) $user done\n               awk -F: ($1!=\"root\" && $1!~/^\+/ && $3<\"$(awk /^\s*U5.5.2_MIN/{print $2} /etc/login.defs)\") {print $1} /etc/passwd | xargs -I {} passwd -S {} | awk ($2!=\"L\" && $2!=\"LK\") {print $1} | while \nread user do usermod -L $user done\n\n"
    '
    @script_file = 'CIS_RHEL8_5_5_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_5_2.sh"}]
  end
end
