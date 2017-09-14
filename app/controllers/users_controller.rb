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
    session.delete[:user_id]
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.name}"
      redirect_to dashboard_path
    else
      flash[:notice] = "All Fields are Required"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :password)
  end

end
