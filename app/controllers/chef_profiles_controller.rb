class ChefProfilesController < ApplicationController
  before_action :validate_admin, only: :index
  before_action :validate_chef,  except: [:index, :show]

  def index
    @chef = ChefProfile.where(approved: false)
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
    unless  @profile == current_user.chef_profile || current_user.admin?
      redirect_to error_path
    end
  end

  private

  def chef_params
    params.require(:chef_profile).permit(:name, :phone, :food_store_id,:user_id)
  end
end
