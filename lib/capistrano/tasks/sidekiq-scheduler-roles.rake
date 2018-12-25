# frozen_string_literal: true

require 'yaml'

set :sidekiq_config, -> { release_path.join('config', 'sidekiq.processed.yml') }

namespace :sidekiq_scheduler_roles do
  task :prepare do
    on roles(:all) do |host|
      host_roles = host.roles_array.map(&:to_s)

      config_path = fetch(:sidekiq_path, release_path).join('config', 'sidekiq.yml')

      sidekiq_config = YAML.load(capture(:cat, config_path))
      next unless sidekiq_config

      schedule = sidekiq_config[:schedule]
      next unless schedule

      schedule.each_key do |key|
        roles = schedule[key].delete('roles')

        next if !roles.is_a?(Array) || roles.empty?

        schedule.delete(key) if (roles & host_roles).empty?
      end

      dump = YAML.dump(sidekiq_config).gsub("'", "\\'")

      execute(:echo, "'#{dump}'", :>, fetch(:sidekiq_config))
    end
  end
end

before 'sidekiq:start', 'sidekiq_scheduler_roles:prepare'
before 'sidekiq:restart', 'sidekiq_scheduler_roles:prepare'
