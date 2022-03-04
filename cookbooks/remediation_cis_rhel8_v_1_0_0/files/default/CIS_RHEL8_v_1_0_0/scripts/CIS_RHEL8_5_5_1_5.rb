# frozen_string_literal: true

#!/usr/bin/env ruby
require 'date'
require 'mixlib/shellout'
Mixlib::ShellOut.new('cat /etc/shadow | cut -d: -f1').run_command.stdout.split.each do |user|
  # convert user chage list to hash
  user_chage_info = Hash[*Mixlib::ShellOut.new("chage --list #{user}").run_command.stdout.delete("\t").strip.gsub(': ', ':').gsub("\n", ':').split(':')]
  today = Date.today.to_time.to_i / 86400
  password_last_changed = (Date.parse user_chage_info['Last password change']).to_time.to_i / 86400
  next unless password_last_changed > today
  cmd = Mixlib::ShellOut.new("command \"passwd -l #{user}\"").run_command
  puts cmd.stdout
  puts cmd.stderr
end