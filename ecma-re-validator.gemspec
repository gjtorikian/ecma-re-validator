# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'ecma-re-validator/version'

Gem::Specification.new do |gem|
  gem.name          = 'ecma-re-validator'
  gem.version       = EcmaReValidator::VERSION
  gem.authors       = ['Garen Torikian']
  gem.email         = ['gjtorikian@gmail.com']
  gem.description   = %(Validate a regular expression string against what ECMA-262 can actually do.)
  gem.summary       = %(Validate a regular expression string against what ECMA-262 can actually do.)
  gem.homepage      = 'https://github.com/gjtorikian/ecma-re-validator'
  gem.license       = 'MIT'
  gem.files         = `git ls-files -z`.split("\x0")
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'regexp_parser', '~> 1.2'

  gem.add_development_dependency 'rspec', '~> 3.1'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'awesome_print'
  gem.add_development_dependency "pry", "~> 0.10"
end
