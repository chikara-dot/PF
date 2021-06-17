class Customer::HomesController < ApplicationController
  def top
    @rank = Category.group(:id).joins(:posts).order("count(posts.category_id) desc").limit(3)
    # カテゴリー別にポストを集める。
  end

  def about
  end
end
