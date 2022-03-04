# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_11 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_11')
    @title = 'Ensure system-wide crypto policy is FUTURE or FIPS (Scored)'
    @scored = true
    @level = 2
    @identifier = '1.11'
    @description = '
    "1.11 Ensure system-wide crypto policy is FUTURE or FIPS (Scored)\nProfile Applicability:\n Level 2 - Server\n Level 2 - Workstation\nDescription:\nThe system-wide crypto-policies followed by the crypto core components allow consistently deprecating and disabling algorithms system-wide.\nThe individual policy levels (DEFAULT, LEGACY, FUTURE, and FIPS) are included in the crypto-policies(7) package.\nRationale:\nIf the Legacy system-wide crypto policy is selected, it includes support for TLS 1.0, TLS 1.1, and SSH2 protocols or later. The algorithms DSA, 3DES, and RC4 are allowed, while RSA and Diffie-Hellman parameters are \naccepted if larger than 1023-bits.\nThese legacy protocols and algorithms can make the system vulnerable to attacks, including those listed in RFC 7457\nFUTURE: Is a conservative security level that is believed to withstand any near-term future attacks. This level does not allow the use of SHA-1 in signature algorithms. The RSA and Diffie-Hellman parameters are \naccepted if larger than 3071 bits. The level provides at least 128-bit security\nFIPS: Conforms to the FIPS 140-2 requirements. This policy is used internally by the fips- mode-setup(8) tool which can switch the system into the FIPS 140-2 compliance mode. The level provides at least 112-bit \nsecurity\nAudit:\nRun the following command to verify that the system-wide crypto policy is Future or FIPS\n# grep -E -i ^\s*(FUTURE|FIPS)\s*(\s+#.*)?$ /etc/crypto-policies/config\nVerify that either FUTURE or FIPS is returned\n\nRemediation:\nRun the following command to change the system-wide crypto policy\n# update-crypto-policies --set FUTURE\nOR\nTo switch the system to FIPS mode, run the following command:\nfips-mode-setup --enable\nImpact:\nThe system-wide cryptographic policy in Red Hat Enterprise Linux 8 does not allow communication using older, insecure protocols. For environments that require to be compatible with Red Hat Enterprise Linux 5 and in \nsome cases also with earlier releases, the less secure LEGACY policy level is available.\nDefault Value:\nDEFAULT\nReferences:\n1. CRYPTO-POLICIES(7)\n2. https://access.redhat.com/articles/3642912#what-polices-are-provided-1\nCIS Controls:\nVersion 7\n14.4 Encrypt All Sensitive Information in Transit Encrypt all sensitive information in transit.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_11.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_11.sh"}]
  end
end
