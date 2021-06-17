class Customer::FavoritesController < ApplicationController

def create
  @category = Category.find(params[:category_id])
  @post = Post.find(params[:post_id])
  favorite = current_customer.favorites.new(post_id: @post.id)
  favorite.save
  # 通知
  post = Post.find(params[:post_id])
  post.create_notification_favorite(current_customer)
end

def destroy
  @category = Category.find(params[:category_id])
  @post = Post.find(params[:post_id])
  favorite = current_customer.favorites.find_by(post_id: @post.id)
  favorite.destroy
end

end
