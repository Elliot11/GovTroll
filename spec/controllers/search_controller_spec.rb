require 'rails_helper'

describe SearchController do
  it 'Renders index page' do
    get :index
    expect(response).to be_success
  end

  it 'Searches and returns results' do
    VCR.use_cassette("NBN") do
      get :results, topic: "NBN"
      expect(assigns(:results)).to be_an_instance_of Array
    end
  end
end