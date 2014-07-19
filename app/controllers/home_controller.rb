class HomeController < ApplicationController

  def index
  	@posts = Post.all.order(created_at: :desc).first(5)
  end

  def guide

  end

  def video
  end
  

  def sign_up_modal
    render partial:'modal', layout: nil
  end
end