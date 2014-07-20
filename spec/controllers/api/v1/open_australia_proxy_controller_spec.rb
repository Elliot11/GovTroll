require 'rails_helper'

describe Api::V1::OpenAustraliaProxyController do
  it 'gets a collections of representatives' do
    VCR.use_cassette('get_representatives') do
      get :representatives
    end
    expect(assigns(:representatives)).to include('party')
  end

  it 'gets an individual representative' do
    VCR.use_cassette('get_representative') do
      get :representative, id: 10562
      expect(assigns(:representative)).to include('party')
    end
  end


end