class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def create
    #@vote = @idea.votes.new(rating: params[:vote][:rating])
  end

  def destroy
  end

  private

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
