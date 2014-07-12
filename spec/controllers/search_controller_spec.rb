require 'rails_helper'

describe SearchController do
  it 'Renders index page' do
    VCR.use_cassette('NBN') do
      get :index, search_criteria: "NBN"
      expect(response).to be_success
    end
  end
end