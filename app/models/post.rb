class Post < ApplicationRecord
  belongs_to :category
  belongs_to :customer
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :comment, dependent: :destroy
  acts_as_taggable

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end

