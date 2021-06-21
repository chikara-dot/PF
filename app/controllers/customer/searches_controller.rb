class Customer::SearchesController < ApplicationController

  def search
    word = params[:search][:word]
    @customers = Customer.search(word)
  end

  def tag_search
    word = params[:search][:word]
    @category = Category.find(params[:category_id])
    @posts = Post.search(word, params[:category_id])
  end

end
