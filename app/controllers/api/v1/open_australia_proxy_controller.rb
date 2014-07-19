class Api::V1::OpenAustraliaProxyController < ApplicationController
  after_filter :set_access
  include HTTParty

  def representatives
    options = {query: {key: "FCSM5EBr95S4CTzZM3BQgApn"}}
    representatives = self.class.get("http://www.openaustralia.org/api/getRepresentatives", options)
    body = JSON.parse(representatives.body)
    render json: {representatives: body}
  end

  def set_access
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  end

end
