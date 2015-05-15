require 'bundler/setup'
require 'chromatic'
require 'command'

rubocop_files = %w(
  **/*.rb
  *.ru
  **/*.rake
  Guardfile
  Gemfile
  **/Capfile
  Rakefile
  **/*.gemspec
)

guard :rubocop, all_on_start: true, cli: %w(-D -S).concat(rubocop_files)do
  watch(/.*\.rb/)
  watch(/.*\.ru/)
  watch(/.+\.rake$/)
  watch(/.*Guardfile$/)
  watch(/.*Gemfile$/)
  watch(/.*Capfile$/)
  watch(/.*Rakefile$/)
  watch(/.*\.gemspec/)
  watch(%r{/(?:.+\/)?\.rubocop\.yml$/}) { |m| File.dirname(m[0]) }
end

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

guard :rspec, cmd: 'bundle exec rspec', all_on_start: true do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
    Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
  end
end

guard :bundler do
  watch('Gemfile')
  # Uncomment next line if your Gemfile contains the `gemspec' command.
  watch(/^.+\.gemspec/)
end

guard :shell do
  watch(/.+\.rake$/) do |m|
    puts "#{m[0]} changed:".bold.cyan
    command = Command.run 'rake -T'
    if command.success?
      puts "* 'rake -T' (still) works! Good!".green
    else
      puts "* 'rake -T' does not work anymore! =>".red
      puts command.stderr.red
    end
  end
end
