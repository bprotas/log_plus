$:.push File.expand_path("../lib", __FILE__)
require "log_plus/version"

def add_security_key specification, method, files
  file = files.is_a?(Array) ? files.first : files
  if File.exists? file
    specification.public_send "#{method}=", files
  else
    puts "WARNING: Security key not found for #{specification.name} gem specification: #{file}"
  end
end

Gem::Specification.new do |s|
  s.name									= "log_plus"
  s.version								= LogPlus::VERSION
  s.platform							= Gem::Platform::RUBY
  s.author								= "Brooke Kuhlmann"
  s.email									= "brooke@redalchemist.com"
  s.homepage							= "https://github.com/bkuhlmann/log_plus"
  s.summary								= "Enhances default Rails logging."
  s.description						= "Enhances default Rails logging with custom log prefixes, max log sizes, and more."
  s.license								= "MIT"

  add_security_key s, "signing_key", File.expand_path("~/.ssh/gem-private.pem")
  add_security_key s, "cert_chain", [File.expand_path("~/.ssh/gem-public.pem")]

  s.required_ruby_version = "~> 2.0"
  s.add_dependency "rails", "~> 4.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-rescue"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-vterm_aliases"
  s.add_development_dependency "pry-git"
  s.add_development_dependency "pry-doc"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rb-fsevent" # Guard file events for OSX.
  s.add_development_dependency "guard-rspec"

  s.files            = Dir["lib/**/*", "vendor/**/*"]
  s.extra_rdoc_files = Dir["README*", "LICENSE*"]
  s.require_paths    = ["lib"]
end
