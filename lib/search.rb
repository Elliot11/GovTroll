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
      {who_said_it:            who_said_it?(r),
       first_name: first_name(r),
       last_name: last_name(r),
       what_do_they_look_like: what_do_they_look_like?(r),
       what_they_said:         what_did_they_say?(r),
       when_they_said_it:      when_did_they_say_it?(r),
       what_is_their_position: what_is_their_position?(r),
       what_is_their_party: what_is_their_party?(r),
       id: person_id(r)
      }
    end
  end

  def person_id(result)
    result.speaker.person_id
  end

  def last_name(result)
    result.speaker.last_name
  end

  def first_name(result)
    result.speaker.first_name
  end
  def what_is_their_party?(result)
    return '' unless result.speaker.party
    "#{result.speaker.party}"
  end

  def what_is_their_position?(result)
    return [] unless result.speaker.offices.length > 0
    offices = result.speaker.offices
    offices.collect {|o| o.position}
  end

  def collect_debates(topic)
    response         = api.get_hansard(search: topic, order: 'd')
    results          = response.results
    total_results    = response.info.total_results
    results_per_page = response.info.results_per_age # Yes, error in OpenAustralia API
    total_pages      = total_results / results_per_page
    #pages_to_collect = total_pages < 10 ? total_pages : 10
    pages_to_collect = total_pages < 2 ? total_pages : 2
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

  def what_do_they_look_like?(result)
    "http://www.openaustralia.org/images/mpsL/" + result.speaker.person_id.to_s + ".jpg"
  end

  def when_did_they_say_it?(result)
    return '' unless result.hdate
    Date.strptime(result.hdate)
  end

  def api
    @api ||= OpenAustralia::Api.new api_key
  end
end