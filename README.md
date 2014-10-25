# Overview

[![Gem Version](https://badge.fury.io/rb/log_plus.png)](http://badge.fury.io/rb/log_plus)
[![Code Climate GPA](https://codeclimate.com/github/bkuhlmann/log_plus.png)](https://codeclimate.com/github/bkuhlmann/log_plus)
[![Code Climate Coverage](https://codeclimate.com/github/bkuhlmann/log_plus/coverage.png)](https://codeclimate.com/github/bkuhlmann/log_plus)
[![Gemnasium Status](https://gemnasium.com/bkuhlmann/log_plus.png)](https://gemnasium.com/bkuhlmann/log_plus)
[![Travis CI Status](https://secure.travis-ci.org/bkuhlmann/log_plus.png)](http://travis-ci.org/bkuhlmann/log_plus)
[![Gittip](http://img.shields.io/gittip/bkuhlmann.svg)](https://www.gittip.com/bkuhlmann)

# Features

- Provides customization of default settings.
- Prefixes log output with timestamps and remote IP addresses.
- Configures max log size to 1MB for local environments (i.e. test and development).
- Configures max log size to 5MB with log rotation (7 files max) for remote environments (i.e. review, stage,
  production, etc).

# Requirements

0. Any of the following Ruby VMs:
    - [MRI 2.x.x](http://www.ruby-lang.org)
    - [JRuby 1.x.x](http://jruby.org)
    - [Rubinius 2.x.x](http://rubini.us)
0. [Ruby on Rails 4.x.x](http://rubyonrails.org).

# Setup

For a secure install, type the following from the command line (recommended):

    gem cert --add <(curl -Ls https://www.alchemists.io/gem-public.pem)
    gem install log_plus --trust-policy MediumSecurity

NOTE: A HighSecurity trust policy would be best but MediumSecurity enables signed gem verification while
allowing the installation of unsigned dependencies since they are beyond the scope of this gem.

For an insecure install, type the following (not recommended):

    gem install log_plus

Add the following to your Gemfile:

    gem "log_plus"

# Usage

Within your application or environment *.rb files, you can configure any of the following settings:

- Log+ Settings:
    - config.log_plus_settings[:max_size] = Optional. Sets max log size (local environments only). Default: 1MB.
- Rails Settings:
    - config.log_tags = Optional. Defines log output (all environments). Default: Timestamp and remote IP prefixes.
    - config.logger = Optional. Configures the Rails logger (all environments). Default: Logger.new (with 5MB max size
      and 7 files max rotation).

# Tests

To test, run:

    bundle exec rspec spec

# Versioning

Read [Semantic Versioning](http://semver.org) for details. Briefly, it means:

- Patch (x.y.Z) - Incremented for small, backwards compatible bug fixes.
- Minor (x.Y.z) - Incremented for new, backwards compatible public API enhancements and/or bug fixes.
- Major (X.y.z) - Incremented for any backwards incompatible public API changes.

# Contributions

Read [CONTRIBUTING](CONTRIBUTING.md) for details.

# Credits

Developed by [Brooke Kuhlmann](https://www.alchemists.io) at [Alchemists](https://www.alchemists.io)

# License

Copyright (c) 2012 [Alchemists](https://www.alchemists.io).
Read the [LICENSE](LICENSE.md) for details.

# History

Read the [CHANGELOG](CHANGELOG.md) for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).
