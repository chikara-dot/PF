class Comment < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :customer
  belongs_to :post
  has_many :notifications, dependent: :destroy
end
