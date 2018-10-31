# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = 'capistrano-sidekiq-scheduler-roles'
  spec.version = '0.1.0'
  spec.authors = ['past-one']
  spec.email   = ['mrpast@live.com']

  spec.summary     = 'A gem for configuring sidekiq-scheduler via capistrano roles.'
  spec.description = 'capistrano-sidekiq-scheduler-roles is a gem ' \
                      'for configuring sidekiq-scheduler via capistrano roles.'
  spec.homepage    = 'https://github.com/umbrellio/capistrano-sidekiq-scheduler-roles'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano'
  spec.add_dependency 'capistrano-sidekiq'
  spec.add_dependency 'sshkit'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rubocop-config-umbrellio'
end
