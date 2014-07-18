class Api::V1::OpenAustraliaProxyController < ApplicationController
  include HTTParty

  def representatives
    options = {query: {key: "FCSM5EBr95S4CTzZM3BQgApn"}}
    representatives = self.class.get("http://www.openaustralia.org/api/getRepresentatives", options)
    body = JSON.parse(representatives.body)
    render json: {members: body}
  end

end
