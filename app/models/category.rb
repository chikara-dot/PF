class Category < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  attachment :image
end
