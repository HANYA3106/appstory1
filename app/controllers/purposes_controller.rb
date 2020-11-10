class PurposesController < ApplicationController
  def new
  end

  def create 
    Purpose.create(content: params[:content])
    redirect_to new_purpose_path
  end
end
