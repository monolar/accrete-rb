# -*- encoding: utf-8 -*-

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'accrete/version'

Gem::Specification.new do |gem|
  gem.name        = 'accrete'
  gem.version     = Accrete::VERSION
  gem.summary     = 'Star system generator'
  gem.description = 'Accrete generates believable star systems according to sagan et.al'
  gem.authors     = ['monolar']
  gem.email       = 'monolar@monolar.org'
  gem.homepage    = 'https://github.com/monolar/accrete-rb'

  gem.files = Dir['lib/accrete.rb',
                  'lib/accrete/**/*']
  gem.test_files = Dir[
    'lib/tasks/**/*',
    'Rakefile',
    'spec/**/*'
  ] - Dir[
    'spec/reports/*'
  ]
  gem.require_paths = ['lib']

  %w().each do |dep|
    gem.add_runtime_dependency(dep)
  end

  %w(
    chromatic
    codeclimate-test-reporter
    command
    guard-bundler
    guard-rspec
    guard-rubocop
    guard-shell
    rake
    rubocop-checkstyle_formatter
    simplecov-rcov
    yard
  ).each do |dep|
    gem.add_development_dependency(dep)
  end
end
