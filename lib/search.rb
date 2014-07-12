class Search
  attr_reader :api_key

  def initialize
    @api_key = OPEN_AUSTRALIA_API_KEY
  end

  def get_representatives
    api.get_representatives
  end

  def find_debates(topic)
    results = collect_debates(topic)
    results.collect do |r|
      next unless who_said_it?(r)
      [who_said_it?(r), what_did_they_say?(r)]
    end
  end

  def collect_debates(topic)
    response         = api.get_hansard(search: topic, order: 'd')
    results          = response.results
    total_results    = response.info.total_results
    results_per_page = response.info.results_per_age # Yes, error in OpenAustralia API
    total_pages      = total_results / results_per_page
    pages_to_collect = total_pages < 10 ? total_pages : 10
    unless pages_to_collect < 1
      (2..pages_to_collect).each do |page|
        next_page = api.get_hansard(search: topic, order: 'd', page: page)
        results.concat next_page.results
      end
    end
    results
  end

  def who_said_it?(result)
    return nil unless !result.speaker.nil?
    " #{result.speaker.last_name}, #{result.speaker.first_name}"
  end

  def what_did_they_say?(result)
    ActionController::Base.helpers.strip_tags(result.body)
  end

  def api
    @api ||= OpenAustralia::Api.new api_key
  end

end