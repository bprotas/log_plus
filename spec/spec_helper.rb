require "bundler/setup"
require "log_plus"
require "pry"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
end
