class PagesController < ApplicationController

  def home 
    @store = FoodStore.all
  end

  def show
  end

  def menu
    @store = FoodStore.find(params[:format])
    @item  = @store.food_items
  end

end
