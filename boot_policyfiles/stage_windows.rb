# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'stage_windows'

# Where to find external cookbooks:
default_source :supermarket, 'https://supermarket.chef.io'
default_source :chef_repo, '../cookbooks'

# run_list: chef-client will run these recipes in the order specified.
run_list 'chef_client::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'
cookbook 'chef_client', path: '../cookbooks/chef_client'
