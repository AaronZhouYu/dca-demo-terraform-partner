# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_10 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_10')
    @title = 'Ensure system-wide crypto policy is not legacy (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.10'
    @description = '
    "1.10 Ensure system-wide crypto policy is not legacy (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nThe system-wide crypto-policies followed by the crypto core components allow consistently deprecating and disabling algorithms system-wide.\nThe individual policy levels (DEFAULT, LEGACY, FUTURE, and FIPS) are included in the crypto-policies(7) package.\nRationale:\nIf the Legacy system-wide crypto policy is selected, it includes support for TLS 1.0, TLS 1.1, and SSH2 protocols or later. The algorithms DSA, 3DES, and RC4 are allowed, while RSA and Diffie-Hellman parameters are \naccepted if larger than 1023-bits.\nThese legacy protocols and algorithms can make the system vulnerable to attacks, including those listed in RFC 7457\nAudit:\nRun the following command to verify that the system-wide crypto policy is not LEGACY\n# grep -E -i ^\s*LEGACY\s*(\s+#.*)?$ /etc/crypto-policies/config\nVerify that not lines are returned\n\nRemediation:\nRun the following command to change the system-wide crypto policy\n# update-crypto-policies --set <CRYPTO POLICY>\nExample:\n# update-crypto-policies --set DEFAULT\nRun the following to make the updated system-wide crypto policy active\n# update-crypto-policies\nImpact:\nThe default system-wide cryptographic policy in Red Hat Enterprise Linux 8 does not allow communication using older, insecure protocols. For environments that require to be compatible with Red Hat Enterprise Linux 5 \nand in some cases also with earlier releases, the less secure LEGACY policy level is available.\nDefault Value:\nDEFAULT\nReferences:\n1. CRYPTO-POLICIES(7)\n2. https://access.redhat.com/articles/3642912#what-polices-are-provided-1\nNotes:\nTo switch the system to FIPS mode, run the following command:\nfips-mode-setup --enable\nCIS Controls:\nVersion 7\n14.4 Encrypt All Sensitive Information in Transit Encrypt all sensitive information in transit.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_10.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_10.sh"}]
  end
end
