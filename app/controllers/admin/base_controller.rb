class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: '/public/404' unless current_admin?
  end

  def dashboard
    if params[:status].nil?
      @orders = Order.all
    else
      @orders = Order.where(status: params[:status])
    end
  end
end
