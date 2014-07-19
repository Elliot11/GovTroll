require 'rails_helper'

describe Api::V1::OpenAustraliaProxyController do
  it 'gets representatives' do
    VCR.use_cassette('get_representatives') do
      get :representatives
    end
    expect(assigns(:representatives))
  end
end