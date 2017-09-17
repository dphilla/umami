class TagsController < ApplicationController

  def index

  end

  def show
    @tag = Tag.find_by(name: params[:name])
    if @tag.nil?
      render file: '/public/404'
    else
      render :show
    end
  end

end
