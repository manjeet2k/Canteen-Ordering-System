class FoodCategoriesController < ApplicationController  
  before_action :validate_admin

  def index
    @category = FoodCategory.all
  end

  def new
    @category = FoodCategory.new
  end

  def create
    @category = FoodCategory.new(cat_params)
    if @category.save
      flash[:success] = "Category Added"
      redirect_to food_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = FoodCategory.find(params[:id])
  end

  def update
    @category = FoodCategory.find(params[:id])
    
    if @category.update(store_params)
      flash[:success] = "FoodCategory was succesfully Updated!"
      redirect_to food_categories_path
    else
      render "edit"
    end
  end

  def destroy
    category = FoodCategory.find(params[:id])
    category.destroy
    flash[:danger] = " FoodCategory #{category.name} was deleted."
    redirect_to food_categories_path
  end

  private
  
  def cat_params
    params.require(:food_category).permit(:name)
  end
end
