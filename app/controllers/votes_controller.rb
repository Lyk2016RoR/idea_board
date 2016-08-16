class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea

  def create
    @vote = @idea.votes.new
    @vote.rating = params[:vote][:rating]
    @vote.user = current_user

    if @vote.save
      redirect_to @idea, notice: "Vote was saved."
    else
      redirect_to @idea, notice: "Vote is not valid."
    end
  end

  def destroy
  end

  private

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
