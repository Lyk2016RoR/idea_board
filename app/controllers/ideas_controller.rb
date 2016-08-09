class IdeasController < ApplicationController
	def new
		@name = "Saygin"
	end

	def index
		@ideas = Idea.all
	end
end
