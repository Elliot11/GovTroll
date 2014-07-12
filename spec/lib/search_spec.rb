require 'rails_helper'

describe 'Search representatives' do
  let(:search) { Search.new }
  it 'gets a lists of representatives' do
    VCR.use_cassette('representatives') do
      reps = search.get_representatives
      expect(reps).to be_an_instance_of Array
    end
  end

  it 'returns a list of results for a given topic' do
    VCR.use_cassette('Asylum') do
      asylum = search.find_debates('asylum')
      expect(asylum).to be_an_instance_of Array
    end
  end
end