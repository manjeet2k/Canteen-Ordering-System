class UserProfilesController < ApplicationController

  def new
    @profile = UserProfile.new
  end

  def dashboard
  end

  def create
    @profile = UserProfile.new(user_profile_params)
    if @profile.save
      flash[:success] = "Profile Saved Successfully!"
      redirect_to user_profile_path(@profile.id)
    else
      render "new"
    end
  end

  def show
    @profile = UserProfile.find(params[:id])   
    return redirect_to error_path unless  @profile == current_user.user_profile || current_user.admin?
  end

  def order_history
    @past_orders = current_user.carts.where(order_status: 3)
  end
  
  private

  def user_profile_params
    params.require(:user_profile).permit(:name, :phone, :user_id)
  end
end
