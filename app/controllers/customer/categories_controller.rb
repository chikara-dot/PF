class Customer::CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.genre_id = params[:genre_id]
    @category.customer_id = current_customer.id
    @category.save
    redirect_to customer_genre_categories_path
  end

  def index
    @categories = Category.where(genre_id: params[:genre_id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    redirect_to customer_genre_categories_path(category.genre_id)

  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to customer_genre_categories_path(category.genre_id)
  end

  private
  def category_params
    params.require(:category).permit(:name,:image)
  end


end
