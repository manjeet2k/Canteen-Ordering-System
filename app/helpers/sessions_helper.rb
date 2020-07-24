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

  def validate_admin
    redirect_to error_path unless logged_in? && current_user.admin?
  end

  def validate_employee
    redirect_to error_path unless logged_in? && current_user.employee? && current_user.employee_profile.present? && current_user.employee_profile.approved?
  end

  def validate_chef
    redirect_to error_path unless logged_in? && current_user.chef? && current_user.chef_profile.present? && current_user.chef_profile.approved?
  end

  def unread_notifications
    @notifications = current_user.notifications.where(read: false)
  end
end