class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.valid?
    category.save
    redirect_to new_category_path
    end
  end

  def show
    category = Category.find(params[:id])
    @stories = Story.where(category_id: category.id)
    @subject = Subject.all
    @purpose = Purpose.all
    @tale = Tale.all
    @genre = category.genre
    gon.category = category
  end

  private
  def category_params
    params.require(:category).permit(:genre, :image)
  end
end
