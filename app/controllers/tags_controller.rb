class TagsController < ApplicationController

  def index

  end

  def show
    @tag = Tag.find_by(name: params[:name])
    @items = @tag.items
  end

end
