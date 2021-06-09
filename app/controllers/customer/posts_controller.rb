class Customer::PostsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new(category_id: @category.id)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.category_id = params[:category_id]
    @post.save
    redirect_to customer_genre_category_posts_path
  end

  def index
    @posts = Post.all
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :image)
  end
end
