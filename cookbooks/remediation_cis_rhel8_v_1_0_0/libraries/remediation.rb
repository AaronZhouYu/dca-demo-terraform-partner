# frozen_string_literal: true

# Resource:: to perform the remediation with attributes supplied to the cookbook
require 'tmpdir'

module Remediation
  class Remediation < Chef::Resource
    resource_name :remediation_runner
    provides :remediation_runner

    # attributes
    property :remediation_attributes, Hash, default: lazy { node[cookbook_name]['attributes'] }

    action :run do
      # will need improved attribute validation some time soon ...
      attributes = new_resource.remediation_attributes.to_hash
      Chef::Log.debug("Remediation attributes: #{attributes}")
      abort('Could not read attributes file!') if attributes.nil?
      Chef::Log.info("=> Remediation runner - #{attributes['provider']} #{attributes['benchmark']} #{attributes['provider_version']} #{attributes['benchmark_platform']}")
      # will need to support various formats etc. - just use yaml initially
      report_outputs = attributes.dup.to_hash
      report_outputs['results'] = {}
      report_outputs['exceptions'] = {}
      global_environment = attributes['global_environment'] || []
      report_file = 'remediation_outputs.yaml'
      files_default = ::File.join(Chef::Config[:file_cache_path], 'cookbooks', 'remediation_cis_rhel8_v_1_0_0', 'files', 'default')
      remediation_profile_dir = "#{attributes['provider']}_#{attributes['benchmark'].tr(' ', '_')}_#{attributes['provider_version'].tr('.', '_')}"
      attributes['controls'].each do |control|
        control_environment = {}
        global_environment.each do |global_env|
          abort "Environment variable must have a name property: #{global_env}" unless global_env.key?('name')
          if global_env.key?('value')
            if !global_env['value'].nil? && global_env['value'] != ''
              control_environment[global_env['name']] = global_env['value'].to_s
            end
          elsif global_env.key?('default') && !global_env['default'].nil? && global_env['default'] != ''
            control_environment[global_env['name']] = global_env['default'].to_s
          end
        end
        control['environment']&.each do |control_env|
          abort "Environment variable must have a name property: #{control_env}" unless control_env.key?('name')
          if control_env.key?('value')
            if !control_env['value'].nil? && control_env['value'] != ''
              control_environment[control_env['name']] = control_env['value'].to_s
            end
          elsif control_env.key?('default') && !control_env['default'].nil? && control_env['default'] != ''
            control_environment[control_env['name']] = control_env['default'].to_s
          end
        end
        # by convention we expect a file with the expected name to exist after generation
        begin
          control_path = ::File.join(files_default, remediation_profile_dir, (control['id']).to_s)
          Chef::Log.debug("Control path: #{control_path}")
          require_relative ::File.join(files_default, remediation_profile_dir, (control['id']).to_s)
          control_instance = ::Object.const_get(control['id']).new
          control_instance.dry_run = attributes['dry_run'] if attributes['dry_run']
          control_instance.enabled = control['enabled'] if control['enabled']
          control_instance.overlay_commands(control['overlay_commands']) if control['overlay_commands']
          control_instance.waiver = control['waiver'] if control['waiver']
          control_instance.environment = control_environment
          control_instance.run
          report_outputs['results'][control['id']] = control_instance.report.to_hash
        rescue SyntaxError => e
          msg = "EXCEPTION for #{control['id']}: #{e.backtrace.join('\n')}"
          Chef::Log.error(msg)
          report_outputs['exceptions'][control['id']] = msg
          report_outputs['results'][control['id']] = {'state'=>'EXCEPTION'}
        end
        report_outputs['summary'] = report_outputs['results'].values.each_with_object(Hash.new(0)) { |k, v| v[k['state']] += 1 }
      end
      Chef::Log.info("=> Execution complete, saving results to #{report_file}")
      ::File.open(::File.join(__dir__, report_file), 'w') do |f|
        f.write(YAML.dump(report_outputs))
      end

      # use /tmp by default but on windows make a temporary directory
      output_file = ::File.join(::File::SEPARATOR, 'tmp', report_file)
      output_file = ::File.join(Dir.tmpdir, report_file) if Gem.win_platform?
      file output_file do
        mode '0755'
        content YAML.dump(report_outputs)
        action :create
      end
    end
  end
end
