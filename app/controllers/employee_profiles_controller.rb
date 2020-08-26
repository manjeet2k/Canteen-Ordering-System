class EmployeeProfilesController < ApplicationController
  before_action :validate_admin,    only: [:index, :update]
  before_action :validate_employee, only: [:dashboard, :show]
  before_action :set_company, only: [:new, :create]

  def index
    @employee_profiles = EmployeeProfile.where(approved: false, rejected: false) 
  end

  def dashboard
    redirect_to error_path if current_user.employee_profile.present? && !current_user.employee_profile.approved? 
  end

  def new
    @employee_profile = EmployeeProfile.new unless current_user.employee_profile.present?
  end

  def create
    @employee_profile = EmployeeProfile.new(emp_params)
    
    if @employee_profile.save
      flash[:success] = "Profile Saved Successfully!"

      User.admins.each do |admin|
        Notification.create(user_id: admin.id, content: "You have got new employee to approve")
      end
      
      redirect_to employee_profile_path(@employee_profile.id)
    else
      render "new"
    end
  end

  def show
    @employee_profile = EmployeeProfile.find(params[:id])   
    redirect_to error_path unless  @employee_profile == current_user.employee_profile
  end

  def update
    @employee_profile = EmployeeProfile.find(params[:id])
    
    if @employee_profile.update(emp_params)
      flash[:success] = "Credits Added"
      redirect_to admin_credit_path
    end
  end

  def order_history
    @past_orders = current_user.carts.delivered_orders
  end

  def favourite_order
    @orders = current_user.carts.delivered_orders.where(favourite: true)
  end
  
  private

  def emp_params
    params.require(:employee_profile).permit(:name, :phone, :company_id, :user_id, :credit)
  end

  def set_company
    @company = Company.all
  end
end
