class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idea
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def create
    @comment = @idea.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @idea, notice: "Comment was saved"
    else
      redirect_to @idea, notice: "Comment couldn't saved"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @idea, notice: "Comment was deleted"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_user!
    redirect_to @idea, notice: "Not authorized" unless @comment.user_id == current_user.id
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

end
