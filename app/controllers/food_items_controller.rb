class FoodItemsController < ApplicationController
  before_action :validate_chef

  def index
    @item = current_store.food_items.order(:id)
  end

  def new
    @item = FoodItem.new
  end

  def create
    @item = current_store.food_items.new(item_params)
    if @item.save 
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
    @item = FoodItem.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "Food item was succesfully Updated!"
      redirect_to food_items_path
    else
      render "edit"
    end
  end

  def destroy
    item = FoodItem.find(params[:id])
    item.destroy
    flash[:danger] = " FoodItem \"#{item.name}\" was deleted."
    redirect_to food_items_path
  end

  private

  def item_params
    params.require(:food_item).permit(:name, :price, :description, :food_store_id)
  end

  def current_store
    current_user.food_store
  end
end
