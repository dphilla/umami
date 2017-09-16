class OrdersController < ApplicationController
  before_action :require_user

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    unless @order
      render file: "/public/404"
    end
  end

  def create
    order = current_user.orders.create
    order.items << get_order_items
    session.delete(:cart)
    redirect_to orders_path
  end

end
