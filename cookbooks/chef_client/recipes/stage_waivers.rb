#
# Cookbook:: chef_client
# Recipe:: stage_waivers
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat'
  cookbook_file '/tmp/waivers.yaml' do
    source 'stage_redhat_waivers.yaml'
    owner  'root'
    group  'root'
    action :create
  end
when 'windows'
  cookbook_file 'C:\chef\waivers.yaml' do
    source 'stage_windows_waivers.yaml'
    action :create
  end
when 'mac_os_x'
  cookbook_file '/tmp/waivers.yaml' do
    source 'stage_mac_waivers.yaml'
    action :create
  end
end
