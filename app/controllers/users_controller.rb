class UsersController < ApplicationController
  before_action :require_user, only: [:dashboard]

  def dashboard
    @user = User.find(session[:user_id])
  end

  def loginpage
    @user = User.new
  end

  def login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.name}"
      redirect_to dashboard_path
    elsif @user
      flash[:notice] = "Incorrect Password for #{@user.name}"
      redirect_to login_path
    else
      flash[:notice] = "Username #{params[:user][:name]} not Registered"
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
