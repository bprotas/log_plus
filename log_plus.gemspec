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
	s.post_install_message	= "(W): www.redalchemist.com. (T): @ralchemist."

	s.required_ruby_version = "~> 1.9.0"
	s.add_dependency "rails", "~> 3.2"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency("rb-fsevent") if RUBY_PLATFORM =~ /darwin/i
  s.add_development_dependency "guard-rspec"
	
  s.files            = Dir["lib/**/*", "vendor/**/*"]
  s.extra_rdoc_files = Dir["README*", "CHANGELOG*", "LICENSE*"]
  s.require_paths    = ["lib"]
end
