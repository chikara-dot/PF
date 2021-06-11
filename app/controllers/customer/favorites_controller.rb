class Customer::FavoritesController < ApplicationController

def create
  post = Post.find(params[:post_id])
  favorite = current_customer.favorites.new(post_id: post.id)
  favorite.save
  redirect_to customer_genre_category_posts_path(post.category.genre_id,post.category)
end

def destroy
  post = Post.find(params[:post_id])
  favorite = current_customer.favorites.find_by(post_id: post.id)
  favorite.destroy
  redirect_to customer_genre_category_posts_path(post.category.genre_id,post.category)
end

end
