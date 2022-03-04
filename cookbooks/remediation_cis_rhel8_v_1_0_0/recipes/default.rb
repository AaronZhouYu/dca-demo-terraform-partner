# frozen_string_literal: true

#
# Cookbook:: remediation
# Recipe:: remediation
#
# Copyright:: 2019, Chef Software
#

benchmark_platform = node[node['recipes'].find { |r| /^remediation_(cis|stig)(_\w+)+_v(_\d+)+/ =~ r }.split('::').first]['attributes']['benchmark_platform']

# benchmark_platform can be in an String for single OS or can be as an Array and this got handle by
# 'platform_family?'( expected values :https://docs.chef.io/infra_language/checking_platforms/#platform_family-values)
# And if the profile is meant to run on any platform we have to add `benchmark_platform` as `all_os`
if platform_family?(benchmark_platform) || benchmark_platform.eql?("all_os")
  remediation_runner 'run' do
    action :run
  end
else
  Chef::Log.info "This cookbook is only for a #{benchmark_platform} platform"
end
