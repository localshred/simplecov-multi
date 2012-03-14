# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simplecov-multi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["BJ Neilsen"]
  gem.email         = ["bj.neilsen@gmail.com"]
  gem.description   = %q{Provide a simple formatter which contains multiple formatters. Similar to the explanation on the SimpleCov README file about using multiple formatters.}
  gem.summary       = %q{SimpleCov Multi Formatter}
  gem.homepage      = "http://github.com/localshred/simplecov-multi"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "simplecov-multi"
  gem.require_paths = ["lib"]
  gem.version       = SimpleCov::Formatter::MultiFormatter::VERSION
end
