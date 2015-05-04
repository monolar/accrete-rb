# -*- encoding: utf-8 -*-

$:.push File.expand_path('../lib', __FILE__)
require 'accrete/version'

Gem::Specification.new do |gem|
  gem.name        = 'accrete'
  gem.version     = Accrete::VERSION
  gem.summary     = 'Star system generator'
  gem.description = 'Accrete generates believable star systems according to sagan et.al'
  gem.authors     = ['monolar']
  gem.email       = 'monolar@monolar.org'
  gem.homepage    = 'http://'

  gem.files = Dir['lib/accrete.rb',
                  'lib/accrete/**/*']
  gem.test_files = Dir['spec/**/*', 'Rakefile', 'lib/tasks/**/*']-Dir['spec/reports/*']
  gem.require_paths = ['lib']

  %w{}.each do |dep|
    gem.add_runtime_dependency(dep)
  end

  %w{chromatic guard-rspec simplecov-rcov yard simplecov-rcov
     command guard-bundler guard-shell guard-rubocop rubocop-checkstyle_formatter}.each do |dep|
    gem.add_development_dependency(dep)
  end
end
