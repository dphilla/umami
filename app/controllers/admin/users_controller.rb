class Admin::UsersController < Admin::BaseController
  
  def edit
    unless current_user.id == params[:id].to_i
      render file: '/public/404'
    end
  end
  
  def update
    current_user.update(admin_params)
    if current_user.save
      redirect_to admin_dashboard_path
    else
      redirect_to edit_admin_user_path(current_user)
    end
  end
  
  
  private
  
  def admin_params
    params.require(:user).permit(:name, :email, :address, :password)
  end
end