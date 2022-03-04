#
# Cookbook:: chef_client
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

if platform?('windows')
  chef_client_scheduled_task 'Run Chef Client in Windows every 5 mins' do
    frequency 'minute'
    frequency_modifier 5
    splay 60
  end
else
  chef_client_systemd_timer 'Run Chef Client in Linux every 5 mins' do
    interval '5m'
    splay '1m'
  end
end
