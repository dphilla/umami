class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: '/public/404' unless current_admin?
  end

  def dashboard
    if params[:status].nil?
      @orders = Order.all
    elsif params[:status] == "ordered"
      @orders = Order.ordered
    elsif params[:status] == "paid"
      @orders = Order.paid
    elsif params[:status] == "cancelled"
      @orders = Order.cancelled
    elsif params[:status] == "completed"
      @orders = Order.completed
    end
  end
end
