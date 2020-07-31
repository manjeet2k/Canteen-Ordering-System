class SessionsController < ApplicationController
  
  def new
    return redirect_to root_path, flash: { warning: "You are already logged in..." } if logged_in?
  end

  def create
    if request.env["omniauth.auth"]
      user = User.create_with_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id  
      get_cart unless current_user.chef? || current_user.admin? 
      redirect_calls  
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        get_cart unless current_user.chef? || current_user.admin? 
        flash[:success] = "Successfully logged in!"
        redirect_calls
      else
        flash[:danger] = "Something Wrong in your login credentials!"
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out succesfully!"
    redirect_to root_path
  end

end
