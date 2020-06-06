module EmployeesHelper
  
  def check_employee
    if logged_in?
      unless current_user.employee?
        redirect_to error_path
      end
    else
      flash[:warning] = "login first!"
      redirect_to login_path
    end
  end

end
