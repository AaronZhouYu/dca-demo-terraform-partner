# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_3_2_8 < CISRemediation
  def initialize
    super('CIS_RHEL8_3_2_8')
    @title = 'Ensure TCP SYN Cookies is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '3.2.8'
    @description = '
    "3.2.8 Ensure TCP SYN Cookies is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation Description:\nWhen tcp_syncookies is set, the kernel will handle TCP SYN packets normally until the half-open connection queue is full, at which time, the SYN cookie functionality kicks in. SYN cookies work by not using the SYN \nqueue at all. Instead, the kernel simply replies to the SYN with a SYN|ACK, but will include a specially crafted TCP sequence number that encodes the source and destination IP address and port number and the time the \npacket was sent. A legitimate connection would send the ACK packet of the three way handshake with the specially crafted sequence number. This allows the system to verify that it has received a valid response to a \nSYN cookie and allow the connection, even though there is no corresponding SYN in the queue.\nRationale:\nAttackers use SYN flood attacks to perform a denial of service attacked on a system by sending many SYN packets without completing the three way handshake. This will quickly use up slots in the kernels half-open \nconnection queue and prevent legitimate connections from succeeding. SYN cookies allow the system to keep accepting valid connections, even if under a denial of service attack.\nAudit:\nRun the following commands and verify output matches:\nNothing should be returned\n      # sysctl net.ipv4.tcp_syncookies\n     net.ipv4.tcp_syncookies = 1\n# grep -E -r \"^\s*net\.ipv4\.tcp_syncookies\s*=\s*[02]\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf\n\nRemediation:\nRun the following command to restore the default parameter and set the active kernel parameters:\nCIS Controls:\nVersion 7\n5.1 Establish Secure Configurations\nMaintain documented, standard security configuration standards for all authorized operating systems and software.\n      # grep -Els \"^\s*net\.ipv4\.tcp_syncookies\s*=\s*[02]*\" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri \n\"s/^\s*(net\.ipv4\.tcp_syncookies\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/\" $filename; done; sysctl -w net.ipv4.tcp_syncookies=1; sysctl -w net.ipv4.route.flush=1\n\n"
    '
    @script_file = 'CIS_RHEL8_3_2_8.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_3_2_8.sh"}]
  end
end
