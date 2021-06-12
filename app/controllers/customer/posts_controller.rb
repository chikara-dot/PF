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
    @category = Category.find(params[:category_id])
    # eachの外に記述したいものなので定義している
    @posts = Post.where(category_id: params[:category_id])
    # 全てのpostの中から一つのカテゴリーの投稿(post)を持ってくる
    # postのcategory_id絡むのidを探す記述(category_id: params[:category_id])
  end

  def show
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :tag_list)
  end

  
end
