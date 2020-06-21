class AdminsController < ApplicationController

  before_action :validate_admin
  
  def dashboard
  end

  def approve_user
    user = Employee.find(params[:id])
    user.approved = true
    if user.save
      flash[:success] = "#{user.name} approved"
    else
      flash[:danger] = "#{user.name} approval failure"
    end
    redirect_to employees_path
  end

end
