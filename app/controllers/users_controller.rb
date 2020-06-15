class UsersController < ApplicationController   
  def new
    @user = User.new
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

  def validate_user
    redirect_to home_path unless current_user and current_user.id == params[:id]
  end

end
