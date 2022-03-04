# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_4_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_4_2')
    @title = 'Ensure filesystem integrity is regularly checked (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.4.2'
    @description = '
    "1.4.2 Ensure filesystem integrity is regularly checked (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nPeriodic checking of the filesystem integrity is needed to detect changes to the filesystem.\nRationale:\nPeriodic file checking allows the system administrator to determine on a regular basis if critical files have been changed in an unauthorized fashion.\nAudit:\nRun the following to verify that aidcheck.service and aidcheck.timer are enabled and running\nOR\nRun the following commands to determine if there is a cron job scheduled to run the aide check.\nEnsure a cron job in compliance with site policy is returned.\n      # systemctl is-enabled aidecheck.service # systemctl status aidecheck.service\n# systemctl is-enabled aidecheck.timer\n# systemctl status aidecheck.timer\n                 # crontab -u root -l | grep aide\n# grep -r aide /etc/cron.* /etc/crontab\n\nRemediation:\nRun the following commands:\nOR\nRun the following command:\n# crontab -u root -e\nAdd the following line to the crontab:\n0 5 * * * /usr/sbin/aide --check\nReferences:\n1. https://github.com/konstruktoid/hardening/blob/master/config/aidecheck.servic e\n2. https://github.com/konstruktoid/hardening/blob/master/config/aidecheck.timer Notes:\nThe checking in this recommendation occurs every day at 5am. Alter the frequency and time of the checks in compliance with site policy.\nCIS Controls:\nVersion 7\n14.9 Enforce Detail Logging for Access or Changes to Sensitive Data\nEnforce detailed audit logging for access to sensitive data or changes to sensitive data (utilizing tools such as File Integrity Monitoring or Security Information and Event Monitoring).\n      # cp ./config/aidecheck.service /etc/systemd/system/aidecheck.service # cp ./config/aidecheck.timer /etc/systemd/system/aidecheck.timer\n# chmod 0644 /etc/systemd/system/aidecheck.*\n# systemctl reenable aidecheck.timer\n# systemctl restart aidecheck.timer\n# systemctl daemon-reload\n\n"
    '
    @script_file = 'CIS_RHEL8_1_4_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_4_2.sh"}]
  end
end
