class UserProfilesController < ApplicationController

  def new
    @user_profile = UserProfile.new
  end

  def dashboard
  end

  def create
    @user_profile = UserProfile.new(user_profile_params)
    
    if @user_profile.save
      flash[:success] = "Profile Saved Successfully!"
      redirect_to user_profile_path(@user_profile.id)
    else
      render "new"
    end
  end

  def show
    @user_profile = UserProfile.find(params[:id])   
    return redirect_to error_path unless  @user_profile == current_user.user_profile || current_user.admin?
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    
    if @user_profile.update(user_profile_params)
      flash[:success] = "Credits Added"
      redirect_to admin_credit_path
    end
  end

  def order_history
    @past_orders = current_user.carts.delivered_orders
  end

  def favourite_order
    @orders = current_user.carts.delivered_orders.where(favourite: true)
  end
  
  private

  def user_profile_params
    params.require(:user_profile).permit(:name, :phone, :user_id, :credit)
  end
end
