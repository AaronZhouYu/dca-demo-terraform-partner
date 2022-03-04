# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'prod_redhat'

# Where to find external cookbooks:
default_source :supermarket, 'https://supermarket.chef.io'
default_source :chef_repo, '../cookbooks'

# run_list: chef-client will run these recipes in the order specified.
run_list 'chef_client::default', 'os-hardening::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'
cookbook 'chef_client', path: '../cookbooks/chef_client'
cookbook 'os-hardening', path: '../cookbooks/os-hardening'

# Invoke the Compliance Phase
default['audit']['compliance_phase'] = true

# Set profile locations
default['audit']['profiles']['linux-baseline'] = {
  'compliance': 'admin/linux-baseline'
}

default['audit']['profiles']['cis-rhel8-level1'] = {
  'compliance': 'admin/cis-rhel8-level1-server'
}

default['audit']['profiles']['cis-rhel8-level2'] = {
  'compliance': 'admin/cis-rhel8-level2-server'
}

# Allow 100 results per control
default['audit']['control_results_limit'] = 100

# Fetch additional profiles
default['audit']['fetcher'] = 'chef-server'

# Set reporter
default['audit']['reporter'] = 'chef-server-automate'

# Set independent Compliance Phase scans
default['audit']['interval']['enabled'] = true

# Define the timing of independent Compliance Phase scans
# Sets scan every 3 minutes
default['audit']['interval']['time'] = 5
