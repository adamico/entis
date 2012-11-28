# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-members'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Members extension for Refinery CMS'
  s.date              = '2012-11-05'
  s.summary           = 'Members extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.0'
  s.add_dependency             'acts_as_indexed',     '~> 0.7'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.0'
end
