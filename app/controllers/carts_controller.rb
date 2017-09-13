class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    @items = Item.find(@cart.contents.keys)
  end

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.name)}."
    redirect_to items_path
  end

end
