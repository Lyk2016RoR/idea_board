class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_idea, only: [:show, :update, :edit, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @idea = Idea.new
    load_form_data
  end

  def index
    @ideas = Idea.all
    @random_ideas = Idea.random_ideas
  end

  def show
    if current_user
      if @idea.votes.where(user_id: current_user.id).any?
        @vote = @idea.votes.where(user_id: current_user.id).first
      else
        @vote = @idea.votes.build
      end
    end
  end

  def create
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      flash[:success] = 'Islem basariyla tamamlandi'
      redirect_to idea_path(@idea)
    else
      load_form_data
      render :new
    end
  end

  def edit
    load_form_data
  end

  def update

    if @idea.update(idea_params)
      redirect_to idea_path(@idea)
    else
      load_form_data
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Idea was deleted"
  end

  private

  def authorize_user!
    redirect_to root_path, notice: "Not authorized" unless @idea.user_id == current_user.id
  end

  def load_form_data
    @categories = Category.all.collect {|c| [c.title, c.id ] }
    @tags = Tag.all
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :planned_to, :category_id, tag_ids: [])
  end


end
