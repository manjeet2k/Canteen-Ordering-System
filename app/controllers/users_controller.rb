class UsersController < ApplicationController    

  def new
    return redirect_to root_path, flash: { warning: "User already logged in" } if logged_in?
    @user = User.new   
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      get_cart unless current_user.chef? || current_user.admin?
      redirect_to new_chef_profile_path     if current_user.chef?
      redirect_to new_employee_profile_path if current_user.employee?
      redirect_to new_user_profile_path     if current_user.user?
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,:role)
  end
end
