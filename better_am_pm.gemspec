Gem::Specification.new do |s|
  s.name        = 'better_am_pm'
  s.version     = '0.0.2'
  s.date        = '2015-05-18'
  s.summary     = "Twelve-hour time selects for Rails and Formtastic"
  s.description = "A monkey-patch for Rails' ActionView::Helpers::DateTimeSelector to add a `twelve_hour` option, which shows hours labeled 12..11 in two optgroups, labeled 'am' and 'pm'"
  s.authors     = ["Parker Morse"]
  s.email       = 'pmorse@dmcouncil.org'
  s.add_runtime_dependency "rails", '>= 3.2.0', '< 4.3'
  s.add_development_dependency 'rspec', '~> 0'
  s.files       = ["lib/better_am_pm.rb"]
  s.homepage    = 'https://github.com/dmcouncil/better_am_pm'
  s.license     = 'MIT'
end