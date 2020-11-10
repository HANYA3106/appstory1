class TalesController < ApplicationController
  def new
  end

  def create
    Tale.create(content: params[:content])
    redirect_to new_tale_path
  end
end
