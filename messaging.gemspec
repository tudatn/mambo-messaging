# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "messaging/version"

Gem::Specification.new do |s|
  s.name        = "mambo-messaging"
  s.version     = Messaging::VERSION
  s.authors     = ["Chris Dion"]
  s.email       = ["chris@verticallabs.ca"]
  s.homepage    = ""
  s.summary     = %q{Mambo Messaging}
  s.description = %q{Mambo Messaging}

  s.rubyforge_project = "mambo-messaging"

	s.files = Dir["{app,config,lib}/**/*"] + ["Rakefile"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "mambo-sms"
  
	s.add_development_dependency "rspec-rails"
	s.add_development_dependency "factory_girl"
	s.add_development_dependency "combustion"
	s.add_development_dependency "magic_encoding"
end
