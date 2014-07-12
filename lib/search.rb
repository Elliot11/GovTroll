class Search
  attr_reader :api_key

  def initialize
    @api_key = OPEN_AUSTRALIA_API_KEY
  end

  def get_representatives
    api.get_representatives
  end

  def find_debates(topic)
    response         = api.get_hansard(search: topic, order: 'd')
    results          = response.results
    total_results    = response.info.total_results
    results_per_page = response.info.results_per_age # Yes, error in OpenAustralia API
    total_pages      = total_results / results_per_page
    pages_to_collect = total_pages < 10 ? total_pages : 10
    unless pages_to_collect < 1
      (2..pages_to_collect).each do |page|
        next_page = api.get_hansard(search: topic, order: 'd', page: page)
        results << next_page.results
      end
    end
    results
  end

  def api
    @api ||= OpenAustralia::Api.new api_key
  end

end