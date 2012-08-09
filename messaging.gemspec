# -*- encoding: utf-8 -*-

#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
  s.add_runtime_dependency "rails"
  s.add_runtime_dependency "mambo-sms"

	s.add_development_dependency "rspec-rails"
	s.add_development_dependency "factory_girl"
	s.add_development_dependency "combustion"
	s.add_development_dependency "mmcopyrights"
	s.add_development_dependency "magic_encoding"
end
