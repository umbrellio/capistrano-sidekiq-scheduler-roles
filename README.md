## capistrano-sidekiq-scheduler-roles

A gem for configuring sidekiq-scheduler via capistrano roles

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "capistrano-sidekiq-scheduler-roles", git: "https://github.com/umbrellio/capistrano-sidekiq-scheduler-roles.git"
```

And then execute:

    $ bundle

Add this to your `Capfile`:

```ruby
require "capistrano/sidekiq"
require "capistrano/sidekiq-scheduler-roles"
```

## Usage

In your `sidekiq.yml` specify jobs with it's roles:
```
:schedule:
  JobForAllRoles:
    every: 1s

  JobForAppRole:
    every: 1m
    roles: [app]

  JobForAppOrDBRoles:
    every: 1h
    roles: [app, db]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/umbrellio/capistrano-sidekiq-scheduler-roles

## License
Released under MIT License.

## Authors
Created by Yakimov Pavel.

<a href="https://github.com/umbrellio/">
<img style="float: left;" src="https://umbrellio.github.io/Umbrellio/supported_by_umbrellio.svg" alt="Supported by Umbrellio" width="439" height="72">
</a>
