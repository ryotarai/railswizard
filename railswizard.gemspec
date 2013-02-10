# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'railswizard/version'

Gem::Specification.new do |gem|
  gem.name          = "railswizard"
  gem.version       = Railswizard::VERSION
  gem.authors       = ["Ryota Arai"]
  gem.email         = ["ryota.arai@gmail.com"]
  gem.description   = %q{A tool to create a new rails app with RailsWizard(http://railswizard.org) template}
  gem.summary       = %q{A tool to create a new rails app with RailsWizard(http://railswizard.org) template}
  gem.homepage      = "https://github.com/ryotarai/railswizard"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday"
  gem.add_dependency "nokogiri"
  gem.add_dependency "thor"
  gem.add_dependency "terminal-table"
end
