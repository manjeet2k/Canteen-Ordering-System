class EmployeeProfilesController < ApplicationController
  before_action :validate_admin,    only: :index
  before_action :validate_employee, except: [:index, :show]
  before_action :set_company, only: [:new, :create]

  def index
    @employee = EmployeeProfile.where(approved: false) 
  end

  def dashboard
  end

  def new
    @profile = EmployeeProfile.new
  end

  def create
    @profile = EmployeeProfile.new(emp_params)
    if @profile.save
      flash[:success] = "Profile Saved Successfully!"
      redirect_to employee_profile_path(@profile.id)
    else
      render "new"
    end
  end

  def show
    @profile = EmployeeProfile.find(params[:id])   
    return redirect_to error_path unless  @profile == current_user.employee_profile || current_user.admin?
  end
  
  private

  def emp_params
    params.require(:employee_profile).permit(:name, :phone, :company_id,:user_id)
  end

  def set_company
    @company = Company.all
  end
end
