$:.push File.expand_path("../lib", __FILE__)

# Maintain version:
require "better_am_pm/version"

Gem::Specification.new do |s|
  s.name        = 'better_am_pm'
  s.version     = BetterAmPm::VERSION
  s.date        = '2015-05-18'
  s.summary     = "Twelve-hour time selects for Rails and Formtastic"
  s.description = "A monkey-patch for Rails' ActionView::Helpers::DateTimeSelector to add a `twelve_hour` option, which shows hours labeled 12..11 in two optgroups, labeled 'am' and 'pm'"
  s.authors     = ["Parker Morse"]
  s.email       = ['pmorse@dmcouncil.org']
  s.add_runtime_dependency "rails", '>= 3.2.0', '< 6'
  s.add_development_dependency 'rspec'
  s.files       = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  s.homepage    = 'https://github.com/dmcouncil/better_am_pm'
  s.license     = 'MIT'
end
