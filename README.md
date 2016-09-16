# No longer maintained in favor of [sshkit-interactive](https://github.com/afeld/sshkit-interactive)


[![Gem Version](https://img.shields.io/gem/v/capistrano-interactive.svg)](https://rubygems.org/gems/capistrano-interactive)
[![Dependencies](https://img.shields.io/gemnasium/ydkn/capistrano-interactive.svg)](https://gemnasium.com/ydkn/capistrano-interactive)
[![Code Climate](https://img.shields.io/codeclimate/github/ydkn/capistrano-interactive.svg)](https://codeclimate.com/github/ydkn/capistrano-interactive)

[![Join the chat](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ydkn/capistrano-interactive)


# Capistrano::Interactive

Interactive command execution for capistrano.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-interactive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-interactive


## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/interactive'
```

Now you can start interactive programs through capistrano.

```ruby
on primary(:app) do
  interact(:htop)
end
```

```ruby
on primary(:app) do
  within current_path do
    interact(:rails, :console, rails_env)
  end
end
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ydkn/capistrano-interactive.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
