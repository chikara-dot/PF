class Category < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :posts, dependent: :destroy
  attachment :image
end
