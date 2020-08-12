class PagesController < ApplicationController  
  
  def home 
    @store_options ||= FoodStore.all.order(:id)
    @category_options ||= FoodCategory.all.order(:id)
    initialize_filters
    handle_filters
  end

  def show
  end

  def notification
    notifications = current_user.notifications.where(read: false)
    
    notifications.each do |n|
      n.toggle!(:read)
    end
  end

  def delete_notifications
    notifications = current_user.notifications
    if notifications.present?
      notifications.delete_all  
      flash[:success] = "Notification Cleared!"
      redirect_to notification_path
    else
      redirect_to notification_path
    end
  end

  private

  def initialize_filters
    @stores = @store_options
    @items = FoodItem.all
    session[:store_filter] = params[:store_filter] 
    session[:store_filter] = nil if params[:store_filter] == ""
    session[:category_filter] = params[:category_filter]
    session[:category_filter] = nil if params[:category_filter] == ""
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
