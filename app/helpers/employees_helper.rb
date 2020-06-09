module EmployeesHelper
  
  def check_employee
    if logged_in?
      redirect_to error_path unless current_user.employee?
    else
      flash[:warning] = "Login first!"
      redirect_to login_path
    end
  end
  
  


end
