class Customer::HomesController < ApplicationController
  def top
    @rank = Category.page(params[:page]).per(3).reverse_order
    @rank = Category.find(post.group(:note_id).order('count(category_id) desc').limit(3).pluck(:customer_id))
  end

  def about
  end
end
