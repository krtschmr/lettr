require 'vcr'

VCR.config do |c|
  c.cassette_library_dir     = 'spec/fixtures/cassette_library'
  c.stub_with :webmock
  c.ignore_localhost         = false
  c.default_cassette_options = { :record => :none }
end

Spec::Runner.configure do |c|
  c.extend VCR::RSpec::Macros
end
