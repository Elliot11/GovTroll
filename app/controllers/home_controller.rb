class HomeController < ApplicationController

	def index
		@posts = Post.all.first(5)
	end

end