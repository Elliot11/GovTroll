class Api::V1::OpenAustraliaProxyController < ApplicationController
  after_filter :set_access
  include HTTParty

  def representatives
    @representatives = self.class.get("http://www.openaustralia.org/api/getRepresentatives", query_options)
    render json: wrap_json(@representatives)
  end

  def representative
    options = query_options
    options[:query].merge!({id: params[:id]})
    @representative = self.class.get('http://www.openaustralia.org/api/getRepresentative', options)
    render json: wrap_json(@representative)
  end

  def query_options
    {query: {key: OPEN_AUSTRALIA_API_KEY}}
  end

  def set_access
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  end

  def wrap_json(json_in)
    body = JSON.parse(json_in.body)
    {representative: body}
  end

end
