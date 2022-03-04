# Remediation for CIS Red Hat Enterprise Linux 8 v1.0.0

## Environment Variables
The following is a list of control IDs and corresponding environment variables which can be used to refine remediation:

  * 1.11: CRYPTO_POLICY set to 'FUTURE' or 'FIPS'
  * 1.3.3: SUDO_LOG_FILE set to a custom log file path
  * 1.5.2: BOOTLOADER_PASSWORD set to a password for boot loader
  * 3.4.1.1: FIREWALL_PACKAGE set to 'firewalld', 'nftables' or 'iptables' - defaults to 'firewalld'
  * 3.4.2.1 - 3.4.2.3: FIREWALL_PACKAGE set to 'firewalld'
  * 3.4.3.1 - 3.4.3.7: FIREWALL_PACKAGE set to 'nftables'
  * 3.4.3.2 - 3.4.3.4: NFTABLES_NAME defaults to 'filter'
  * 3.4.4.1.2 - 3.4.4.2.2: FIREWALL_PACKAGE set to 'iptables'
  * 4.1.2.1: MAX_LOG_FILE set to a number representing audit log storage size in MB
  * 5.2.5: SSH_LOG_LEVEL set to 'INFO' or 'VERBOSE' - defaults to 'INFO'
  * 5.5.3: USER_SHELL_TIMEOUT defaults to 900