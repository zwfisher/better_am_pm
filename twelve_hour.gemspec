Gem::Specification.new do |s|
  s.name        = 'twelve_hour'
  s.version     = '0.0.1'
  s.date        = '2015-04-06'
  s.summary     = "Twelve-hour time selects for Rails and Formtastic"
  s.description = "A monkey-patch for Rails' ActionView::Helpers::DateTimeSelector to add a `twelve_hour` option, which shows hours labeled 12..11 in two optgroups, labeled 'am' and 'pm'"
  s.authors     = ["Parker Morse"]
  s.email       = 'pmorse@dmcouncil.org'
  s.files       = ["lib/twelve_hour.rb"]
  s.homepage    = 'https://github.com/dmcouncil/twelve_hour'
  s.license     = 'MIT'
end