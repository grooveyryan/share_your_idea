class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  def index
    @ideas = Idea.all.order('created_at DESC')
  end

  def show
  end

  def new
    @idea = current_user.ideas.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create

    @idea = current_user.ideas.build(idea_params)
    @idea.category_id = params[:category_id]
    if @idea.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :content)
    end

    def find_idea
      @idea = Idea.find(params[:id])
    end

end
