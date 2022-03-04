# frozen_string_literal: true

require_relative 'cis_remediation'

class CIS_RHEL8_1_6_2 < CISRemediation
  def initialize
    super('CIS_RHEL8_1_6_2')
    @title = 'Ensure address space layout randomization (ASLR) is enabled (Scored)'
    @scored = true
    @level = 1
    @identifier = '1.6.2'
    @description = '
    "1.6.2 Ensure address space layout randomization (ASLR) is enabled (Scored)\nProfile Applicability:\n Level 1 - Server\n Level 1 - Workstation\nDescription:\nAddress space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space of key data areas of a process.\nRationale:\nRandomly placing virtual memory regions will make it difficult to write memory page exploits as the memory placement will be consistently shifting.\nAudit:\nRun the following commands and verify output matches:\n      # sysctl kernel.randomize_va_space\nkernel.randomize_va_space = 2\n# grep \"kernel\.randomize_va_space\" /etc/sysctl.conf /etc/sysctl.d/* kernel.randomize_va_space = 2\n\nRemediation:\nSet the following parameter in /etc/sysctl.conf or a /etc/sysctl.d/* file: kernel.randomize_va_space = 2\nRun the following command to set the active kernel parameter:\n# sysctl -w kernel.randomize_va_space=2\nCIS Controls:\nVersion 7\n8.3 Enable Operating System Anti-Exploitation Features/ Deploy Anti-Exploit Technologies\nEnable anti-exploitation features such as Data Execution Prevention (DEP) or Address Space Layout Randomization (ASLR) that are available in an operating system or deploy appropriate toolkits that can be configured \nto apply protection to a broader set of applications and executables.\n\n"
    '
    @script_file = 'CIS_RHEL8_1_6_2.sh'
    @commands = [{"script_bash"=>"bash #{@script_directory}/CIS_RHEL8_1_6_2.sh"}]
  end
end
