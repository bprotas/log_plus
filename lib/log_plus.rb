require File.join File.dirname(__FILE__), "log_plus", "version.rb"

# Rails Enhancements
if defined? Rails
  # Engine
  require File.join File.dirname(__FILE__), "log_plus", "engine.rb"
end
