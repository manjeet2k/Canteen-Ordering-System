class ChefsController < ApplicationController

  before_action :validate_chef

  def new
    @chef = Chef.new
    @store = FoodStore.all
    redirect_to error_path if current_user.chef
  end

  def create
    chef = Chef.new(chef_params)
    chef.user_id = current_user.id

    if chef.save
      flash[:success] = "Profile Saved Successfully!"
      redirect_to chef_path(chef.id)
    else
      flash[:danger] = "Something went wrong. Try again!"
      redirect_to new_chef_path
    end
  end

  def show
    @chef = Chef.find(params[:id])
    unless  @chef == current_user.chef 
      redirect_to error_path
    end
  end

  def edit
  end

  def destroy
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :phone, :food_store_id,:user_id)
  end
  
end
