class Post < ApplicationRecord
  belongs_to :category
  belongs_to :customer
  attachment :image
end

