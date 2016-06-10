$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'foreman_sentry/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'foreman_sentry'
  s.version     = ForemanSentry::VERSION
  s.authors     = ['Brandon Weeks']
  s.email       = ['weeks@squareup.com']
  s.homepage    = 'https://github.com/brandonweeks/foreman_sentry'
  s.summary     = 'Foreman plugin to send exceptions to Sentry'
  s.license     = 'Apache-2.0'

  s.files = Dir['{app,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'rails', '>= 4.1.14.2'
  s.add_runtime_dependency 'sentry-raven', '~> 1.0'

  s.add_development_dependency 'rubocop', '~> 0.40.0'
end
