class Customer::CategoriesController < ApplicationController
  before_action :set_genre, only: %i[create]

  def new
    @category = Category.new
  end

  def create
    @category = @genre.categories.build(category_params)
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
    params.require(:category).permit(:name,:image, :genre_id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
end
