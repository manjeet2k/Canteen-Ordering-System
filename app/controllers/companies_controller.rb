class CompaniesController < ApplicationController
  before_action :validate_admin
  before_action :set_company, only: [:edit, :update, :destroy]
  
  def index
    @company = Company.all.order(:id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(comp_params)
    return redirect_to companies_path, flash: { success: ("Company was succesfully created!") } if @company.save 
    render "new"
  end

  def edit
  end

  def update
    return redirect_to companies_path, flash: { success: ( "Company was successfully updated!")} if @company.update(comp_params)
    render 'edit'
  end

  def destroy
    redirect_to companies_path, flash:{ danger: ("Company #{@company.name} was deleted!")} if @company.destroy    
  end

  private
  
  def comp_params
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end  
end
