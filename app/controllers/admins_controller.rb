class AdminsController < ApplicationController
  before_action :validate_admin
  before_action :set_chef,     only: [:approve_chef, :reject_chef]
  before_action :set_employee, only: [:approve_employee, :reject_chef]
  
  def dashboard
  end

  def approve_employee
    approve_profile(@employee)
    redirect_to employee_profiles_path
  end

  def reject_employee
    reject_profile(@employee)
    redirect_to employee_profiles_path
  end

  def approve_chef    
    approve_profile(@chef)
    redirect_to chef_profiles_path
  end

  def reject_chef
    reject_profile(@chef)
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

  private 

  def set_employee
    @employee = EmployeeProfile.find(params[:id])
  end

  def set_chef
    @chef = ChefProfile.find(params[:id])
  end
end
