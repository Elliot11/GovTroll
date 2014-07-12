require 'rails_helper'

describe SearchController do
  it 'Renders index page' do
    get :index, {search_criteria: "What's Tone up to this week?"}
    expect(response).to be_success
    end
end