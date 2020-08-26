class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Review added successfully!"
      redirect_to order_history_user_profiles_path if current_user.user?
      redirect_to order_history_employee_profiles_path if current_user.employee?
    else
      render "new"
    end
  end

  def edit
    @review = Review.find params[:id]
    return redirect_to error_path if @review.user != current_user
  end

  def update
    @review = Review.find(params[:id])
    
    if @review.update(review_params)
      flash[:success] = "Review was succesfully Updated!"
      redirect_to order_history_user_profiles_path if current_user.user?
      redirect_to order_history_employee_profiles_path if current_user.employee?
    else
      flash[:warning] = "#{review.errors.full_messages}"
      render 'edit'
    end
  end

  def destroy
    review = Review.find(params[:id])
    return redirect_to error_path if review.user != current_user
    review.destroy
    flash[:danger] = " Review was deleted."
    redirect_to order_history_user_profiles_path if current_user.user?
    redirect_to order_history_employee_profiles_path if current_user.employee?
  end

  private 

  def review_params
    params.require(:review).permit(:feedback, :rating, :user_id, :cart_id)
  end
end
