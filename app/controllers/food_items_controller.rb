class FoodItemsController < ApplicationController

  before_action :validate_chef

  def index
    @item = current_user.food_store.food_items
  end

  def new
    @item = FoodItem.new
  end

  def create
    item = FoodItem.new(itm_params)
    item.food_store_id = current_user.food_store.id

    if item.save 
      flash[:success] = "Food Item Successfully Created"
      redirect_to food_items_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @item = FoodItem.find(params[:id])
  end

  def update
    item = FoodItem.find(params[:id])

    if item.update(itm_params)
      flash[:success] = "Food item was succesfully Updated!"
      redirect_to food_items_path
    else
      flash[:warning] = "#{item.errors.full_messages}"
      render "edit"
    end
  end

  def destroy
    item = FoodItem.find(params[:id])
    item.delete
    flash[:danger] = " FoodItem \"#{item.name}\" was deleted."
    redirect_to food_items_path
  end

  private

  def itm_params
    params.require(:food_item).permit(:name, :price, :description, :food_store_id)
  end

end
