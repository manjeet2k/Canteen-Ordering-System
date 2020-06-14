class FoodStoresController < ApplicationController
  include SessionsHelper

  before_action :is_admin?
  
  def index
    @store = FoodStore.all
  end

  def new
    @store = FoodStore.new
  end

  def create
    store = FoodStore.new(store_params)
    
    if store.save
      flash[:success] = "FoodStore was succesfully created!"
      redirect_to food_stores_path
    else
      flash[:warning] = "#{store.errors.full_messages}"
      redirect_to 
    end
  end

  def edit
    @store = FoodStore.find(params[:id])
  end

  def update
    store = FoodStore.find(params[:id])
    
    if store.update(store_params)
      flash[:success] = "FoodStore was succesfully Updated!"
      redirect_to food_stores_path
    else
      flash[:warning] = "#{store.errors.full_messages}"
      redirect_to edit_food_store_path(@store)
    end
  end

  def destroy
    store = FoodStore.find(params[:id])
    store.delete
    flash[:danger] = " FoodStore #{store.name} was deleted."
    redirect_to food_stores_path
  end

  private
  
  def store_params
    params.require(:food_store).permit(:name)
  end
end
