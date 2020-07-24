class ChefProfilesController < ApplicationController
  before_action :validate_admin, only: :index
  before_action :validate_chef,  except: [:index, :new, :create]
  before_action :set_chef, only: [:show, :update]

  def index
    @chef = ChefProfile.where(approved: false)
  end

  def dashboard
  end
   
  def new
    @profile  = ChefProfile.new
    @store = FoodStore.all
  end

  def create
    @profile = ChefProfile.new(chef_params)
    @store = FoodStore.all
    if @profile.save
      flash[:success] = "Profile Saved Successfully!"
      Notification.create(user_id: User.where(admin: true).first.id, content: "You have got new chef to approve")
      redirect_to chef_profile_path(@profile.id)
    else
      render "new"
    end
  end

  def show
    redirect_to error_path unless current_user.chef_profile == @profile
  end

  def orders
    orders = Cart.where(food_store_id: current_user.chef_profile.food_store_id)
    @live_orders = orders.where(order_status: 1..2).order(:id)
    @past_orders = orders.where(order_status: 3)
  end

  def order_update
    cart = Cart.find params[:id]
    if cart.update(order_status: params[:cart][:order_status])
      flash[:success]= "Order Status Updated"
      cart.messages.delete_all if (params[:cart][:order_status] == 3)
      Notification.create(user_id: cart.user_id, content: "Your Current Order Status: #{cart.order_status}")
      redirect_to orders_chef_profiles_path
    end
  end 

  def gallery
    @profile = current_user.chef_profile
  end

  def update
    unless params[:chef_profile].nil?
      if @profile.update(chef_params)
        flash[:success] = "Image upload successfull!"
        redirect_to gallery_chef_profiles_path
      else
        render "gallery"
      end
    else
      flash[:danger] = "Choose files first!"
      redirect_to gallery_chef_profiles_path
    end
  end

  private

  def chef_params
    params.require(:chef_profile).permit(:name, :phone, :food_store_id, :user_id, images: [])
  end

  def set_chef
    @profile = ChefProfile.find(params[:id])
  end
end
