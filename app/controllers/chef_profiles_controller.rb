class ChefProfilesController < ApplicationController
  before_action :validate_admin, only: :index
  before_action :validate_chef,  except: [:index, :show]

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
      redirect_to chef_profile_path(@profile.id)
    else
      render "new"
    end
  end

  def show
    @profile = ChefProfile.find(params[:id])
  end

  def orders
    @orders = Cart.where(order_status: 1..2)
  end

  def order_update
    cart = Cart.find params[:id]
    if cart.update(order_status: params[:cart][:order_status])
      flash[:success]= "Order Status Updated"
      redirect_to orders_chef_profiles_path
    end
  end 

  private

  def chef_params
    params.require(:chef_profile).permit(:name, :phone, :food_store_id,:user_id)
  end
end
