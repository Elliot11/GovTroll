require 'spec_helper'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end

describe 'Search representatives' do
  it 'gets a lists of representative' do

  end
end