class PagesController < ApplicationController  
  
  def home 
    @store = FoodStore.all
  end

  def show
  end

  def menu
    @store = FoodStore.find(params[:food_store])
    @item  = @store.food_items
  end

  def notification
  end
end
