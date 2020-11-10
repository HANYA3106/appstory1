class StoriesController < ApplicationController
  before_action :set_params, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @stories = Story.includes(:user).order('created_at DESC').limit(10)
    @category = Category.select(:id,:image)
    @subject = Subject.all
    @purpose = Purpose.all
    @tale = Tale.all
    @ranks = Story.find(Like.group(:story_id).order("count(story_id) desc").limit(10).pluck(:story_id))
  end

  def new
    @story = Story.new
    @category = Category.all
    @subject = Subject.offset( rand(Subject.count) ).first
    @purpose = Purpose.offset( rand(Purpose.count) ).first
    @tale = Tale.offset( rand(Tale.count) ).first
    gon.subject = @subject
    gon.purpose = @purpose
    gon.tale = @tale
  end
  
  def create
    @story = Story.new(params_story)
    @story.user_id = current_user.id
    if @story.valid?
      @story.save
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    story = Story.find(params[:id])
    if story.valid?
      story.update(story_params)
      redirect_to story_path, method: :get
    else
      render 'edit'
    end
  end

  def destroy
    story = Story.find(params[:id])
    if story.valid? 
      story.destroy
      redirect_to root_path, method: :get
    else
      render 'show'
    end
  end

  def show
    @comment = Comment.new()
    @comments = @story.comments.includes(:user)
    @like = Like.new
  end

  def rank
    @ranks = Story.find(Like.group(:story_id).order('count(story_id) desc').limit(30).pluck(:story_id))
    @category = Category.select(:id,:image)
    @subject = Subject.all
    @purpose = Purpose.all
    @tale = Tale.all
  end

  private

  def set_params
    @story = Story.find(params[:id])
  end

  def params_story
    params.permit(:text, :category_id, :subject_id, :purpose_id, :tale_id)
  end

  def story_params
    params.require(:story).permit(:text, :category_id, :subject_id, :purpose_id, :tale_id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
