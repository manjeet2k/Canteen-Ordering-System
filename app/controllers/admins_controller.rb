class AdminsController < ApplicationController
  before_action :validate_admin
  
  def dashboard
  end

  def approve_employee
    employee = EmployeeProfile.find(params[:id])
    approve_user(employee)
    redirect_to employee_profiles_path
  end

  def reject_employee
    employee = EmployeeProfile.find(params[:id])
    reject_user(employee)
    redirect_to employee_profiles_path
  end

  def approve_chef
    chef = ChefProfile.find(params[:id])
    approve_user(chef)
    redirect_to chef_profiles_path
  end

  def reject_chef
    chef = ChefProfile.find(params[:id])
    reject_user(chef)
    redirect_to chef_profiles_path
  end

  def hide_store
    @store = FoodStore.find(params[:id])
    @store.toggle!(:indexing)
    redirect_to food_stores_path
  end

  def orders
    @orders = Cart.to_approve
  end

  def approve_order
    order = Cart.find params[:id]
    order.order_status = 1

    if order.save
      flash[:success] = "Order Approved"
      order.store.chef_profiles.each do |chef|
        Notification.create(user_id: chef.user.id, content: "Recieved a new order")
      end
      Notification.create(user_id: order.user_id, content: "Your order has been sent to store")
      redirect_to admin_orders_path
    end
  end
end
