# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_4_4 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_4_4')
    @title = 'Ensure password hashing algorithm is SHA-512 (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.4.4'
    @description = '
    "5.4.4 Ensure password hashing algorithm is SHA-512 (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nThe commands below change password encryption from md5 to sha512 (a much stronger hashing algorithm). All existing accounts will need to perform a password change to upgrade the stored hashes to the new algorithm.\nRationale:\nThe SHA-512 algorithm provides much stronger hashing than MD5, thus providing additional protection to the system by increasing the level of effort for an attacker to successfully determine passwords.\nNote that these change only apply to accounts configured on the local system.\nAudit:\nVerify password hashing algorithm is sha512. This setting is configured with the pam_unix.so sha512 option found in /etc/pam.d/system-auth and /etc/pam.d/password-\nauth\nRun the following command:\nThe output should be similar to:\n      # grep -E ^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$ /etc/pam.d/password-auth /etc/pam.d/system-auth\n           /etc/pam.d/password-auth:password sufficient pam_unix.so sha512 shadow try_first_pass use_authtok\n/etc/pam.d/system-auth:password sufficient pam_unix.so sha512\n       shadow try_first_pass use_authtok remember=5\n\nRemediation:\nSet password hashing algorithm to sha512.\nRun the following script to dd or modify the pam_unix.so lines in the password-auth and system-auth files to include the sha512 option:\nNotes:\nAdditional module options may be set, recommendation only covers those listed here.\nIf it is determined that the password algorithm being used is not SHA-512, once it is changed, it is recommended that all user 5.4.4s be immediately expired and forced to change their passwords on next login. To \naccomplish that, the following commands can be used. Any system accounts that need to be expired should be carefully done separately by the system administrator to prevent any potential problems.\nCIS Controls:\nVersion 7\n16.4 Encrypt or Hash all Authentication Credentials\nEncrypt or hash with a salt all authentication credentials when stored.\n      CP=$(authselect current | awk NR == 1 {print $3} | grep custom/) for FN in system-auth password-auth; do\n[[ -z $(grep -E ^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$ $PTF) ]] && sed - ri s/^\s*(password\s+sufficient\s+pam_unix.so\s+)(.*)$/\1\2 sha512/ $PTF done\nauthselect apply-changes\n                     # awk -F: ( $3<\"$(awk /^\s*U5.4.4_MIN/{print $2} /etc/login.defs)\" && $1 != \"nfsnobody\" ) { print $1 } /etc/passwd | xargs -n 1 chage -d 0\n\n"
    '
    @script_file = 'CIS_RHEL8_5_4_4.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_4_4.sh"}]
  end
end
