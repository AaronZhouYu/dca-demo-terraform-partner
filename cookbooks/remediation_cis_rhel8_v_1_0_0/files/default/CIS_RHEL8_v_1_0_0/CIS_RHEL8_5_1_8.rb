# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_1_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_1_8')
    @title = 'Ensure at/cron is restricted to authorized users (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.1.8'
    @description = '
    "5.1.8 Ensure at/cron is restricted to authorized users (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nConfigure /etc/cron.allow and /etc/at.allow to allow specific users to use these services. If /etc/cron.allow or /etc/at.allow do not exist, then /etc/at.deny and /etc/cron.deny are checked. Any user not specifically \ndefined in those files is allowed to use at and cron. By removing the files, only users in /etc/cron.allow and /etc/at.allow are allowed to use at and cron. Note that even though a given user is not listed in \ncron.allow , cron jobs can still be run as that user. The cron.allow file only controls administrative access to the crontab command for scheduling and modifying cron jobs.\nRationale:\nOn many systems, only the system administrator is authorized to schedule cron jobs. Using the cron.allow file to control who can run cron jobs enforces this policy. It is easier to manage an allow list than a deny \nlist. In a deny list, you could potentially add a user 5.1.8 to the system and forget to add it to the deny files.\nAudit:\nRun the following commands and ensure /etc/cron.deny and /etc/at.deny do not exist:\nRun the following command and verify Uid and Gid are both 0/root and Access does not grant permissions to group or other for both /etc/cron.allow and /etc/at.allow :\n      # stat /etc/cron.deny\nstat: cannot stat `/etc/cron.deny: No such file or directory\n# stat /etc/at.deny\nstat: cannot stat` /etc/at.deny: No such file or directory\n                 # stat /etc/cron.allow\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n# stat /etc/at.allow\nAccess: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)\n\nRemediation:\nRun the following commands to remove /etc/cron.deny and /etc/at.deny and create and set permissions and ownership for /etc/cron.allow and /etc/at.allow :\n      # rm /etc/cron.deny\n# rm /etc/at.deny\n# touch /etc/cron.allow\n# touch /etc/at.allow\n# chmod og-rwx /etc/cron.allow\n# chmod og-rwx /etc/at.allow\n                   # chown root:root /etc/cron.allow\n# chown root:root /etc/at.allow\n     CIS Controls:\nVersion 7\n16 Account Monitoring and Control Account Monitoring and Control\n\n"
    '
    @script_file = 'CIS_RHEL8_5_1_8.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_1_8.sh"}]
  end
end
