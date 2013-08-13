# Overview

[![Gem Version](https://badge.fury.io/rb/log_plus.png)](http://badge.fury.io/rb/log_plus)
[![Code Climate GPA](https://codeclimate.com/github/bkuhlmann/log_plus.png)](https://codeclimate.com/github/bkuhlmann/log_plus)
[![Travis CI Status](https://secure.travis-ci.org/bkuhlmann/log_plus.png)](http://travis-ci.org/bkuhlmann/log_plus)

# Features

* Prefixes all logs with timestamps and remote IP addresses.
* Sets max size on all logs to 1MB (for development environment only).
* Allows all configurations, provided by this gem, to be customized.

# Requirements

0. [Ruby 2.0.x+](http://www.ruby-lang.org/en).
0. [Ruby on Rails 4.0.x](http://rubyonrails.org).

# Setup

Type the following from the command line to securely install (recommended):

    gem cert --add <(curl -Ls https://raw.github.com/bkuhlmann/log_plus/master/gem-public.pem)
    gem install log_plus -P HighSecurity

...or type the following to insecurely install (not recommended):

    gem install log_plus

Add the following to your Gemfile:

    gem "log_plus"

# Usage

Within your application or environment *.rb files, you can configure any of the following settings:

* config.max_log_size = Defaults to 1MB (use numbers only). Provided by this gem.
* config.log_tags = Defaults to timestamp and remote IP prefixes. Provided by Rails.

# Tests

To test, do the following:

0. cd to the gem root.
0. bundle install
0. bundle exec rspec spec

# Versioning

Read [Semantic Versioning](http://semver.org) for details. Briefly, it means:

* Patch (x.y.Z) - Incremented for small, backwards compatible bug fixes.
* Minor (x.Y.z) - Incremented for new, backwards compatible public API enhancements and/or bug fixes.
* Major (X.y.z) - Incremented for any backwards incompatible public API changes.

# Contributions

Read CONTRIBUTING for details.

# Credits

Developed by [Brooke Kuhlmann](http://www.redalchemist.com) at [Red Alchemist](http://www.redalchemist.com)

# License

Copyright (c) 2012 [Red Alchemist](http://www.redalchemist.com).
Read the LICENSE for details.

# History

Read the CHANGELOG for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).
