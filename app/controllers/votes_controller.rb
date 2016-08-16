class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea
  before_action :set_vote, only: [:update]
  before_action :authorize_user!, only: [:update]

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

  def update
    if @vote.update(rating: params[:vote][:rating])
      redirect_to @idea, notice: "Vote was saved."
    else
      redirect_to @idea, notice: "Vote is not valid."
    end
  end

  private

  def authorize_user!
    redirect_to @idea, notice: "Not authorized" unless @vote.user_id == current_user.id
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
