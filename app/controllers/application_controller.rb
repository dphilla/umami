class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :require_user,
                :current_user

  def require_user
    unless current_user
      flash[:notice] = "You Must Log in or Register to View this Page"
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
