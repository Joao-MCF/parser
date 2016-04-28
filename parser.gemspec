# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parser/version'

Gem::Specification.new do |spec|
  spec.name          = "parser"
  spec.version       = Parser::VERSION
  spec.authors       = ["Marcle Rodrigues"]
  spec.email         = ["maarclee@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  end

  spec.summary       = %q{Quake 3 log parser.}
  spec.description   = %q{Quake 3 log parser proposed as a test by Code Miner 42.}
  spec.homepage      = "https://github.com/marclerodrigues/parser.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
