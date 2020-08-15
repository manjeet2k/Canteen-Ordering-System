class ChefProfilesController < ApplicationController
  before_action :validate_admin, only: :index
  before_action :validate_chef,  except: [:index, :new, :create]
  before_action :set_chef, only: [:show, :update]
  before_action :set_store, only: [:new, :create]

  def index
    @chef_profiles = ChefProfile.where(approved: false, rejected: false)
  end

  def dashboard
  end
   
  def new
    @chef_profile  = ChefProfile.new
  end

  def create
    @chef_profile = ChefProfile.new(chef_params)

    if @chef_profile.save
      flash[:success] = "Profile Saved Successfully!"

      User.admins.each do |admin|
        Notification.create(user_id: admin.id, content: "You have got new chef to approve")
      end

      redirect_to chef_profile_path(@chef_profile.id)
    else
      render "new"
    end
  end

  def show
    redirect_to error_path unless current_user.chef_profile == @chef_profile
  end

  def orders
    orders = Cart.where(food_store_id: current_user.chef_profile.food_store_id)
    @live_orders = orders.live_orders
    @past_orders = orders.delivered_orders
  end

  def order_update
    order = Cart.find params[:id]
    
    if order.update(order_status: params[:cart][:order_status])
      flash[:success]= "Order Status Updated"
      Notification.create(user_id: order.user_id, content: "Your Current Order Status: #{order.order_status}")
      
      if order.order_status == "Delivered"
        order.messages.delete_all
      end
      
      redirect_to orders_chef_profiles_path
    end
  end 

  def gallery
    @chef_profile = current_user.chef_profile
  end

  def update
    if params[:chef_profile].nil?
      flash[:danger] = "Choose files first!"
      redirect_to gallery_chef_profiles_path
    else
      if @chef_profile.update(chef_params)
        flash[:success] = "Image upload successfull!"
        redirect_to gallery_chef_profiles_path
      else
        render "gallery"
      end      
    end
  end

  private

  def set_chef
    @chef_profile = ChefProfile.find(params[:id])
  end

  def set_store
    @store = FoodStore.all
  end

  def chef_params
    params.require(:chef_profile).permit(:name, :phone, :food_store_id, :user_id, images: [])
  end
end
