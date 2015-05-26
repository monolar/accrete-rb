#!/usr/bin/env rake
# -*- encoding: utf-8 -*-

def try
  yield if block_given?
  rescue LoadError => e
    p "Run `rake rvm:dev_env:setup` to satisfy all dependencies: #{e.inspect}"
end

try { require 'bundler/setup' }

Dir['lib/tasks/**/*.rake'].each do |task|
  try { load task }
end

# tests
try do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
end
