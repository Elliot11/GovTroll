class HomeController < ApplicationController

  def index
  	@posts = Post.all.first(5)
  end

  def sign_up_modal
    render partial:'modal', layout: nil
  end
end