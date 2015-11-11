# coding: utf-8
require File.expand_path('../lib/dry/constructor/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'dry-constructor'
  spec.version       = Dry::Constructor::VERSION.dup
  spec.authors       = ['Andy Holland']
  spec.email         = ['andyholland1991@aol.com']
  spec.summary       = 'A simple dependency injection library for Plain Old Ruby Objects'
  spec.homepage      = 'https://github.com/dryrb/dry-constructor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
