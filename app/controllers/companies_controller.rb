class CompaniesController < ApplicationController
  include SessionsHelper

  before_action :is_admin?
  
  def index
    @company = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    company = Company.new(comp_params)
    
    if company.save
      flash[:success] = "Company was succesfully created!"
      redirect_to "/companies"
    else
      flash[:warning] = "#{company.errors.full_messages}"
      redirect_to "/companies/new"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    
    if company.update(comp_params)
      flash[:success] = "Company was succesfully Updated!"
      redirect_to "/companies"
    else
      flash[:warning] = "#{company.errors.full_messages}"
      redirect_to "/companies/#{company.id}/edit"
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
    flash[:danger] = " Company #{company.name} was deleted."
    redirect_to "/companies"
  end

  private
  
  def comp_params
    params.require(:company).permit(:name)
  end
  
end
