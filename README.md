# Accrete

## General

Star system generator based on Sagan / Rand corp

## Local Development Setup

### Prerequisites

* ruby
    * `rvm` install via `\curl -L https://get.rvm.io | bash`
    * install ruby via `rvm install _theRecommendedRuby_` (see recommendation in .ruby-version.dev)

### Manual Environment Setup

Execute in terminal:

<pre>
$ ln -s .ruby-gemset.dev .ruby-gemset
$ ln -s .ruby-version.dev .ruby-version
$ cd .
$ gem install bundler
$ bundle install
</pre>

### Automatic Environment Setup

execute `rake rvm:dev_env:setup` and follow instructions

### Executing tests

#### rspec

Execute

<pre>
$ bundle exec rake
</pre>

#### coverage reports

set environment variable `COVERAGE` to `html`, e.g.

<pre>
$ COVERAGE=html bundle exec rake
</pre>

Coverage report is then in `coverage` subfolder: `open coverage/index.html` (on OS X)

Possible values are `html` for html report or `rcov` for rcov compatible xml report (interesting for continuos integration).

### Executing Linting

* For linting rubocop (https://github.com/bbatsov/rubocop) is used. Simply execute

  <pre>
  $ bundle exec rubocop
  </pre>

  to list offenses.

* For continuous integration purposes the checkstyle formatter can be used:

  <pre>
  $ bundle exec rubocop --require rubocop/formatter/checkstyle_formatter --format RuboCop::Formatter::CheckstyleFormatter --no-color --out checkstyle
  </pre>

  This produces a checkstyle xml file which can be used by e.g. a jenkins checkstyle plugin (e.g. https://wiki.jenkins-ci.org/display/JENKINS/Checkstyle+Plugin)

### Local development via `guard`

Execute `bundle exec guard` during local development. If required automatic refresh of coverage reports can be also set by setting the `COVERAGE` environment variable as described above.
