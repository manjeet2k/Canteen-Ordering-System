class FoodStoresController < ApplicationController
  before_action :validate_admin
  
  def index
    @store = FoodStore.all
  end

  def new
    @store = FoodStore.new
    @category = FoodCategory.all
  end

  def create
    @store = FoodStore.new(store_params)
    return redirect_to food_stores_path, flash: { success: ("FoodStore was succesfully created!") } if @store.save  
    render 'new'
  end

  def edit
    @store = FoodStore.find(params[:id])
    @category = FoodCategory.all
  end

  def update
    store = FoodStore.find(params[:id])
    
    if store.update(store_params)
      flash[:success] = "FoodStore was succesfully Updated!"
      redirect_to food_stores_path
    else
      flash[:warning] = "#{store.errors.full_messages}"
      render 'edit'
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
    params.require(:food_store).permit(:name, :food_category_id)
  end
end
