class EmployeeProfilesController < ApplicationController
  before_action :validate_admin,    only: :index
  before_action :validate_employee, only: [:dashboard, :show]
  before_action :set_company, only: [:new, :create]

  def index
    @employee = EmployeeProfile.where(approved: false) 
  end

  def dashboard
    redirect_to error_path if current_user.employee_profile.present? && !current_user.employee_profile.approved? 
  end

  def new
    @profile = EmployeeProfile.new unless current_user.employee_profile.present?
  end

  def create
    @profile = EmployeeProfile.new(emp_params)
    if @profile.save
      flash[:success] = "Profile Saved Successfully!"
      Notification.create(user_id: User.where(admin: true).first.id, content: "You have got new employee to approve")
      redirect_to employee_profile_path(@profile.id)
    else
      render "new"
    end
  end

  def show
    @profile = EmployeeProfile.find(params[:id])   
    redirect_to error_path unless  @profile == current_user.employee_profile
  end

  def order_history
    @past_orders = current_user.carts.where(order_status: 3)
  end
  
  private

  def emp_params
    params.require(:employee_profile).permit(:name, :phone, :company_id, :user_id)
  end

  def set_company
    @company = Company.all
  end
end
