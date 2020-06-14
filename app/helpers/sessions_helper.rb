module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:danger] = "You must log in to continue..."
      redirect_to login_path
    end
  end
  
  def current_role
    @role ||= User.find(session[:user_id]).role
  end

  def is_admin?
    unless logged_in? && current_user.admin
      redirect_to error_path
    end
  end

end