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

  def order
    @orders = Cart.where(order_status: 0)
  end

  def approve_order
    order = Cart.find params[:id]
    order.order_status = 1
    if order.save
      flash[:success] = "Order Approved"
      redirect_to admin_orders_path
    end
  end
end
