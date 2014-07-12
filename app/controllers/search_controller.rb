class SearchController < ApplicationController

  def index
    @search_criteria = get_params[:search_criteria]
    # @topics = search_topics(@search_criteria)
  end

  private

  def get_params
    params.permit(:search_criteria)
  end

  # def search_topics(topic)
  #   api.get_hansard(search: topic)
  # end

end