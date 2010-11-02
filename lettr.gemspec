Gem::Specification.new do |s|
  s.name        = "lettr"
  s.version     = "1.0.0"
  s.author      = "Digineo GmbH"
  s.email       = "kontakt@digineo.de"
  s.homepage    = "http://digineo.de"
  s.summary     = "NewsletterBoy Api"
  s.description = "NewsletterBoy Api"

  s.files        = Dir["{lib,test}/**/*"] + Dir["[A-Z]*"] + ["init.rb"]
  s.require_path = "lib"

  s.add_dependency('rest-client', '>=1.6.1')
  s.add_development_dependency('rspec', '<2.0')
  s.add_development_dependency('webmock')
  s.add_development_dependency('vcr')
end