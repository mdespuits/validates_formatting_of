# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validates_formatting_of/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Bridges"]
  gem.email         = ["mbridges.91@gmail.com"]
  gem.description   = %q{Common Rails validations wrapped in a gem.}
  gem.summary       = %q{Adds several convenient methods to validate things such as emails, urls, and phone numbers in a Rails application}
  gem.homepage      = "https://github.com/mattdbridges/validates_formatting_of"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "validates_formatting_of"
  gem.require_paths = ["lib"]
  gem.version       = ValidatesFormattingOf::VERSION

  gem.add_dependency "activemodel"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "its"
end
