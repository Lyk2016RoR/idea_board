class CommentsController < ApplicationController
  before_action :set_idea

  def create
    @comment = @idea.comments.new(comment_params)
    if @comment.save
      redirect_to @idea, notice: "Comment was saved"
    else
      redirect_to @idea, notice: "Comment couldn't saved"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

end
