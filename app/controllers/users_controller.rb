class UsersController < ApplicationController
  include ActionController::Live

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @stories = user.stories.order("created_at DESC")
    @subject = Subject.all
    @purpose = Purpose.all
    @tale = Tale.all
    @categories = Category.select(:id)
    @story = @stories.each do |story|
    gon.category = @categories[(story.category_id)-1].id
    end
  end
end
