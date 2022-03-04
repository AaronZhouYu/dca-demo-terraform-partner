current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'aaron'
client_key               "#{current_dir}/aaron.pem"
validation_client_name   'sa-validator'
validation_key           "#{current_dir}/sa-validator.pem"
chef_server_url          'https://${automate_hostname}/organizations/sa'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../../cookbooks"]