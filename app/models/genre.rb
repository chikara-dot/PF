class Genre < ApplicationRecord
  has_many :categories, dependent: :destroy
  validates :name,    length: { in: 1..15 }

end
