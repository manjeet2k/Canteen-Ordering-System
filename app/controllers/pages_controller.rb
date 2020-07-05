class PagesController < ApplicationController  
  
  def home 
    @store = FoodStore.all
    get_cart if logged_in?
  end

  def show
  end

  def menu
    @store = FoodStore.find(params[:id])
    @item  = @store.food_items
  end
 
  

end
