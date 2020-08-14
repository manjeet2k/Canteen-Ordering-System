class FoodItemsController < ApplicationController
  before_action :validate_chef

  def index
    @food_items = current_store.food_items.order(:id)
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = current_store.food_items.new(food_item_params)

    if @food_item.save 
      flash[:success] = "Food Item Successfully Created"
      redirect_to food_items_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @food_item = FoodItem.find(params[:id])
  end

  def update
    @food_item = FoodItem.find(params[:id])

    if @food_item.update(food_item_params)
      flash[:success] = "Food item was succesfully Updated!"
      redirect_to food_items_path
    else
      render "edit"
    end
  end

  def destroy
    food_item = FoodItem.find(params[:id])
    food_item.destroy
    flash[:danger] = " FoodItem \"#{food_item.name}\" was deleted."
    redirect_to food_items_path
  end

  private

  def food_item_params
    params.require(:food_item).permit(:name, :price, :description, :food_store_id)
  end

  def current_store
    current_user.food_store
  end
end
