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
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
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
