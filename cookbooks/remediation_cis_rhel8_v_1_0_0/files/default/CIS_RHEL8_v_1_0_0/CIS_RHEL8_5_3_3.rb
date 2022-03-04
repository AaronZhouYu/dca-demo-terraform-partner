# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_3_3 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_3_3')
    @title = 'Ensure authselect includes with-faillock (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.3.3'
    @description = '
    "5.3.3 Ensure authselect includes with-faillock (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe pam_faillock.so module maintains a list of failed authentication attempts per user during a specified interval and locks the account in case there were more than deny consecutive failed authentications. It stores \nthe failure records into per-user files in the tally directory\nRationale:\nLocking out user 5.3.3s after n unsuccessful consecutive login attempts mitigates brute force password attacks against your systems.\nAudit:\nRun the following commands to verify that authselect includes the with-faillock feature\n      # authselect current | grep with-faillock\n- with-faillock\n# grep with-faillock /etc/authselect/authselect.conf with-faillock\n\nRemediation:\nRun the following command to include the with-faillock option # authselect select <PROFILE NAME> with-faillock Example:\nReferences:\n1. faillock(8) - Linux man page\nCIS Controls:\nVersion 7\n16.7 Establish Process for Revoking Access\nEstablish and follow an automated process for revoking system access by disabling accounts immediately upon termination or change of responsibilities of an employee or contractor . Disabling these accounts, instead \nof deleting accounts, allows preservation of audit trails.\n               # authselect select custom/custom-profile with-sudo with-faillock without- nullok\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nRun the following command to include the with-faillock option\n# authselect select <PROFILE NAME> with-faillock\n\nExample:\n# authselect select custom/custom-profile with-sudo with-faillock without-nullok'\n"}]
  end
end
