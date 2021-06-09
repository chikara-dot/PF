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
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name,:image)
  end


end
