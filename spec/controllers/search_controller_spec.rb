require 'rails_helper'

describe SearchController do
  before :each do
    stub_request()
  end


  it 'Renders index page' do
    get :index, {search_criteria: "What's Tone up to this week?"}
    expect(response).to be_success
    end
end