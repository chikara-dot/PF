class Customer::PostsController < ApplicationController
   before_action :authenticate_customer!,except: [:index, :show]
  def new
    @category = Category.find(params[:category_id])
    @post = Post.new(category_id: @category.id)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.category_id = params[:category_id]

    if @post.image_or_title_present?(post_params[:images])
      @post.save
      redirect_to customer_genre_category_posts_path
    else
      flash[:notice] = "本文か画像どちらかを入力してください"
      @category = Category.find(params[:category_id])
      render :new
    end



  end

  def index
    @category = Category.find(params[:category_id])
    # eachの外に記述したいものなので定義している
    @posts = Post.where(category_id: params[:category_id])
    # 全てのpostの中から一つのカテゴリーの投稿(post)を持ってくる
    # postのcategory_idカラムのidを探す記述(category_id: params[:category_id])
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_genre_category_posts_path
  end

  def report
    @post = Post.find(params[:post_id])
    @post.create_notification_report(current_customer)
  end


  private
  def post_params
    params.require(:post).permit(:title, {images: []}, :tag_list)
  end


end


