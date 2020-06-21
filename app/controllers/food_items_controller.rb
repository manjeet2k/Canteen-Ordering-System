class FoodItemsController < ApplicationController

  before_action :validate_chef

  def index
    if current_user.admin?
      @item = FoodItem.all
    else
      @item = current_user.food_store.food_items
    end
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
  end

  def update
  end

  def delete
  end

  private

  def itm_params
    params.require(:food_item).permit(:name, :price, :description, :food_store_id)
  end

end
