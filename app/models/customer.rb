class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 attachment :image
 has_many :categories, dependent: :destroy
 has_many :posts, dependent: :destroy
 has_many :favorites, dependent: :destroy
 def active_for_authentication?
   super && (self.is_deleted == false)
  # デフォルトがフォルスならtrueを返す
 end
end
