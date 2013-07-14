# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundationize/version'

Gem::Specification.new do |spec|
  spec.name          = "foundationize"
  spec.version       = Foundationize::VERSION
  spec.authors       = ["Mohanad Najeeb"]
  spec.email         = ["mohanad.najeeb@eptikar.com"]
  spec.description   = %q{Foundationize is a ruby gem to ease the use of ZURB Foundation with rails apps.}
  spec.summary       = %q{Scaffold generators.}
  spec.homepage      = "https://github.com/Eptikar-IT-Solutions/foundationize"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'zurb-foundation', '~> 4.2.3'

end
