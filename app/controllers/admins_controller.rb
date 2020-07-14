class AdminsController < ApplicationController
  before_action :validate_admin
  
  def dashboard
  end

  def approve_employee
    @user = EmployeeProfile.find(params[:id])
    approve_user
    redirect_to employee_profiles_path
  end

  def approve_chef
    @user = ChefProfile.find(params[:id])
    approve_user
    redirect_to chef_profiles_path
  end

  private

  def approve_user
    @user.approved = true
    if @user.save
      flash[:success] = "#{@user.name} approved!"
    else
      flash[:danger] = "#{@user.name} approval failure"
    end
  end


end
