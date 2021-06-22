class Category < ApplicationRecord

  validates :name,    length: { in: 1..15 }
  validates :image, presence: true
  belongs_to :customer
  belongs_to :genre
  has_many :posts, dependent: :destroy
  attachment :image
end
