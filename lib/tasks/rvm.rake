# -*- encoding: utf-8 -*-

namespace :rvm do
  namespace :dotfiles do
    desc 'Links the ruby-*.dev files'
    task :link do
      link_dot_files
      puts %(Activate environment via 'cd .')
    end

    desc 'Unlinks the ruby-*.dev files if they are linked to the provided .dev files'
    task :unlink do
      File.unlink('.ruby-gemset') if
        File.exist?('.ruby-gemset') &&
        (File.readlink('.ruby-gemset') == '.ruby-gemset.dev')
      File.unlink('.ruby-version') if
        File.exist?('.ruby-version') &&
        (File.readlink('.ruby-version') == '.ruby-version.dev')
    end
  end

  namespace :dev_env do
    desc 'Setup local developemnt environment'
    task :setup do
      link_dot_files
      puts %(Activate environment via 'cd .' and then execute 'gem install bundler; bundle install')
    end
  end

  def link_dot_files
    File.symlink('.ruby-gemset.dev', '.ruby-gemset') unless
      File.exist?('.ruby-gemset')
    File.symlink('.ruby-version.dev', '.ruby-version') unless
      File.exist?('.ruby-version')
  end
end
