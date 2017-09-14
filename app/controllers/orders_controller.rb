class OrdersController < ApplicationController
  before_action :require_user
  
  def index
    @orders = current_user.orders
  end

end
