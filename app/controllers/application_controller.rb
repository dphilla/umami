class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :require_user

  def require_user
    unless session[:user_id]
      flash[:notice] = "You Must Log in or Register to View this Page"
      redirect_to login_path
    end
  end

end
