class Customer::FavoritesController < ApplicationController

def create
  post = Post.find(params[:post_id])
  favorite = current_customer.favorites.new(post_id: post.id)
  favorite.save
  # 通知
  post = Post.find(params[:post_id])
  post.create_notification_favorite(current_customer)
  redirect_back(fallback_location: root_path)
end

def destroy
  post = Post.find(params[:post_id])
  favorite = current_customer.favorites.find_by(post_id: post.id)
  favorite.destroy
  redirect_back(fallback_location: root_path)
end

end
