class EmployeesController < ApplicationController
  include EmployeesHelper
  include SessionsHelper

  before_action :check_employee

  def new
    @employee = Employee.new
    @company = Company.all
  end

  def create
    employee = Employee.new(emp_params)
    employee.user_id = current_user.id

    if employee.save
      flash[:success] = "Profile Saved Successfully!"
      redirect_to employee_path(employee.id)
    else
      flash[:danger] = "Something went wrong. Try again!"
      redirect_to signup_path
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private

  def emp_params
    params.require(:employee).permit(:name, :phone, :company_id,:user_id)
  end

end
