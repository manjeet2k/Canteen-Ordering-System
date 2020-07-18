class SessionsController < ApplicationController
  
  def new
    if logged_in?
      flash[:warning] = "You are already logged in..."
      redirect_to root_path
    else 
      return
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      get_cart unless current_user.chef? || current_user.admin?
      flash[:success] = "Successfully logged in!"
      redirect_to dashboard_path if current_user.admin?
      redirect_to dashboard_chef_profiles_path if current_user.chef?
      redirect_to dashboard_employee_profiles_path if current_user.employee? 
      redirect_to dashboard_user_profiles_path if (current_user.user? && !current_user.admin?)
    else
      flash[:danger] = "Something Wrong in your login credentials!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out succesfully!"
    redirect_to root_path
  end

end
