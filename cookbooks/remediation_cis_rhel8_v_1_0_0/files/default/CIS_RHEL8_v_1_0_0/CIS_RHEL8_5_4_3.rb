# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_4_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_4_3')
    @title = 'Ensure password reuse is limited (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.4.3'
    @description = '
    "5.4.3 Ensure password reuse is limited (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe /etc/security/opasswd file stores the users old passwords and can be checked to ensure that users are not recycling recent passwords.\n remember=<5> - Number of old passwords to remember Rationale:\nForcing users not to reuse their past 5 passwords make it less likely that an attacker will be able to guess the password.\nNote that these change only apply to accounts configured on the local system.\nAudit:\nRun the following command and verify that the remembered password history is 5 or more.\nThe output should be similar to:\n      # grep -E ^\s*password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\s+. *remember=([5-9]|[1-4][0-9])[0-9]*\s*.*$ /etc/pam.d/system-auth\n             password requisite pam_pwquality.so try_first_pass local_users_only enforce-for-root retry=3 remember=5\npassword sufficient pam_unix.so sha512 shadow try_first_pass use_authtok remember=5\n\nRemediation:\nSet remembered password history to conform to site policy.\nRun the folloing script to add or modify the pam_pwhistory.so and pam_unix.so lines to include the remember option:\n      CP=$(authselect current | awk NR == 1 {print $3} | grep custom/)\n[[ -n $CP ]] && PTF=/etc/authselect/$CP/system-auth || PTF=/etc/authselect/system-auth\n[[ -n $(grep -E ^\s*password\s+(sufficient\s+pam_unix|requi(red|site)\s+pam_pwhistory).so\s+ ([^#]+\s+)*remember=\S+\s*.*$ $PTF) ]] && sed -ri \ns/^\s*(password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\\n               s+)(.*)(remember=\S+\s*)(.*)$/\1\4 remember=5 \6/ $PTF || sed -ri s/^\s*(password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\ s+)(.*)$/\1\4 remember=5/ $PTF\nauthselect apply-changes\n         Notes:\nAdditional module options may be set, recommendation only covers those listed here.\nCIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n\n"
    '
    @script_file = 'CIS_RHEL8_5_4_3.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_4_3.sh"}]
  end
end
