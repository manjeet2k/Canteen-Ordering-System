class UsersController < ApplicationController   
  include SessionsHelper 

  def new
    if logged_in?
      flash[:warning] = "User already logged in"
      redirect_to root_path
    else 
      @user = User.new
    end
    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_employee_path if current_user.employee?
      redirect_to new_chef_path if current_user.chef?
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,:role)
  end
end
