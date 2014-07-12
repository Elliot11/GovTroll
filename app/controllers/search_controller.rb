class SearchController < ApplicationController

  def index
  end

  def results
    search_query = get_params
    @results = Search.new.find_debates(search_query)
  end

  private

  def get_params
    params.permit(:topic)
  end
end