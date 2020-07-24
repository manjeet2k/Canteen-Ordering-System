class AdminsController < ApplicationController
  before_action :validate_admin
  
  def dashboard
  end

  def approve_employee
    @user = EmployeeProfile.find(params[:id])
    approve_user(@user)
    redirect_to employee_profiles_path
  end

  def approve_chef
    @user = ChefProfile.find(params[:id])
    approve_user(@user)
    redirect_to chef_profiles_path
  end

  def orders
    @orders = Cart.where(order_status: 0)
  end

  def approve_order
    order = Cart.find params[:id]
    order.order_status = 1
    if order.save
      flash[:success] = "Order Approved"
      Notification.create(user_id: order.store.chef_profiles.first.user.id, content: "Recieved a new order")
      Notification.create(user_id: order.user_id, content: "Your order has been sent to store")
      redirect_to admin_orders_path
    end
  end
end
