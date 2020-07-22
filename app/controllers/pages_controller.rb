class PagesController < ApplicationController  
  
  def home 
    @store_options ||= FoodStore.all
    @category_options ||= FoodCategory.all
    initialize_filters
    handle_filters
  end

  def show
  end

  def notification
  end

  private

  def initialize_filters
    @stores = @store_options
    @items = FoodItem.all
    params[:store_filter] = nil if params[:store_filter] == ""
    session[:store_filter] = params[:store_filter]
    params[:category_filter] = nil if params[:category_filter] == ""
    session[:category_filter] = params[:category_filter]
  end

  def handle_filters
    if session[:store_filter]
      @store = FoodStore.find(session[:store_filter])
      @items_filtered = @store.food_items
    elsif session[:category_filter]
      @category = FoodCategory.find(session[:category_filter])
      @stores = @category.food_stores
    end
  end
end
