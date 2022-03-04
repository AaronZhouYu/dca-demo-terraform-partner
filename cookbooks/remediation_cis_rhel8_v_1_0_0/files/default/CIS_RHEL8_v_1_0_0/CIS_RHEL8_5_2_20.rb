# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_5_2_20 < CISRemediation
  def initialize
    super('CIS_RHEL8_5_2_20')
    @title = 'Ensure system-wide crypto policy is not over-ridden (Scored)'
    @scored = true
    @level = 1
    @identifier = '5.2.20'
    @description = '
    "5.2.20 Ensure system-wide crypto policy is not over-ridden (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nSystem-wide Crypto policy can be over-ridden or opted out of for openSSH\nRationale:\nOver-riding or opting out of the system-wide crypto policy could allow for the use of less secure Ciphers, MACs, KexAlgoritms and GSSAPIKexAlgorithsm\nAudit:\nRun the following command:\n# grep ^/s*CRYPTO_POLICY= /etc/sysconfig/sshd\nNo output should be returned\nRemediation:\nRun the following commands:\nCIS Controls:\nVersion 7\n14.4 Encrypt All Sensitive Information in Transit Encrypt all sensitive information in transit.\n               # sed -ri \"s/^\s*(CRYPTO_POLICY\s*=.*)$/# \1/\" /etc/sysconfig/sshd # systemctl reload sshd\n\n"
    '
    @script_file = 'CIS_RHEL8_5_2_20.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_5_2_20.sh"}]
  end
end
