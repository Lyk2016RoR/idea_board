class IdeasController < ApplicationController
	def new
		@idea = Idea.new
	end

	def index
		@ideas = Idea.all
	end

	def show
		@idea = Idea.find(params[:id])
	end

	def create
		@idea = Idea.new(strong_params)

		if @idea.save
			redirect_to idea_path(@idea)
		else
			render :new
		end
	end

	def strong_params
		params.permit(:title, :description, :planned_to)
	end
end
