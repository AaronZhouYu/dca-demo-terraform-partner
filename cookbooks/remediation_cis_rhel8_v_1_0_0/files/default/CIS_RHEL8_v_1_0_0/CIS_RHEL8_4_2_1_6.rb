# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_4_2_1_6 < CISRemediation
  def initialize
    super('CIS_RHEL8_4_2_1_6')
    @title = 'Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)'
    @scored = false
    @level = 1
    @identifier = '4.2.1.6'
    @description = '
    "4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nBy default, rsyslog does not listen for log messages coming in from remote systems. The ModLoad tells rsyslog to load the imtcp.so module so it can listen over a network via TCP. The InputTCPServerRun option \ninstructs rsyslogd to listen on the specified TCP port.\nRationale:\nThe guidance in the section ensures that remote log hosts are configured to only accept rsyslog data from hosts within the specified domain and that those systems that are not designed to be log hosts do not accept \nany remote rsyslog messages. This provides protection from spoofed log data and ensures that system administrators are reviewing reasonably complete syslog data in a central location.\nAudit:\nRun the following commands and verify the resulting lines are uncommented on designated log hosts and commented or removed on all others:\n      # grep $ModLoad imtcp /etc/rsyslog.conf /etc/rsyslog.d/*.conf $ModLoad imtcp\n# grep $InputTCPServerRun /etc/rsyslog.conf /etc/rsyslog.d/*.conf $InputTCPServerRun 514\n\nRemediation:\nFor hosts that are designated as log hosts, edit the /etc/rsyslog.conf file and un- comment or add the following lines:\nFor hosts that are not designated as log hosts, edit the /etc/rsyslog.conf file and comment or remove the following lines:\nRun the following command to reload the rsyslogd configuration: # systemctl restart rsyslog\nReferences:\n1. See the rsyslog(8) man page for more information.\nNotes:\nThe $ModLoad imtcp line can have the .so extension added to the end of the module, or use the full path to the module.\nCIS Controls:\nVersion 7\n9.2 Ensure Only Approved Ports, Protocols and Services Are Running\nEnsure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.\n      $ModLoad imtcp\n$InputTCPServerRun 514\n             # $ModLoad imtcp\n     # $InputTCPServerRun 514\n\n"
    '
    @script_file = ''
    @commands = [{"local"=>"echo 'Automated remediation unavailable. Please remediate manually:\n\nFor hosts that are designated as log hosts, edit the /etc/rsyslog.conf file and un-comment or add the following lines:\n$ModLoad imtcp\n$InputTCPServerRun 514\n\nFor hosts that are not designated as log hosts, edit the /etc/rsyslog.conf file and comment or remove the following lines:\n# $ModLoad imtcp\n# $InputTCPServerRun 514\n\nRun the following command to reload the rsyslogd configuration:\n# systemctl restart rsyslog'\n"}]
  end
end
