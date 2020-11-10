class SubjectsController < ApplicationController
  def new
  end
  
  def create
    Subject.create(content: params[:content])
    redirect_to new_subject_path
  end
end
