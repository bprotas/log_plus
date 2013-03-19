# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "log_plus/version"

Gem::Specification.new do |s|
  s.name									= "log_plus"
  s.version								= LogPlus::VERSION
  s.platform							= Gem::Platform::RUBY
  s.author								= "Brooke Kuhlmann"
  s.email									= "brooke@redalchemist.com"
  s.homepage							= "http://www.redalchemist.com"
  s.summary								= "Enhances default Rails logging."
  s.description						= "Enhances default Rails logging with custom log prefixes, max log sizes, and more."
	s.license								= "MIT"

	s.required_ruby_version = "~> 2.0.0"
	s.add_dependency "rails", "~> 3.2"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-vterm_aliases"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rb-fsevent" # Guard file events for OSX.
  s.add_development_dependency "rb-inotify" # Guard file events for Linux.
  s.add_development_dependency "guard-rspec"
	
  s.files            = Dir["lib/**/*", "vendor/**/*"]
  s.extra_rdoc_files = Dir["README*", "CHANGELOG*", "LICENSE*"]
  s.require_paths    = ["lib"]
end
