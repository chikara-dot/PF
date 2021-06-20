class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 default_scope -> { order(created_at: :desc) }

 attachment :image
 has_many :categories, dependent: :destroy
 has_many :posts, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :comments, dependent: :destroy
 def active_for_authentication?
   super && (self.is_deleted == false)
  # デフォルトがフォルスならtrueを返す
 end

 has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
# relationshipをreverse_of_relationshipsに置き換える記述。主キーはfollowed_id
 has_many :followers, through: :reverse_of_relationships, source: :follower
#  自分をフォローしている人

 has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :followings, through: :relationships, source: :followed

 has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
 # 自分からの通知、通知を送った人
 has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
 # 相手からの通知、通知が送られた人

  acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests


 def follow(customer_id)
     relationships.create(followed_id: customer_id)
 end

 def unfollow(customer_id)
     relationships.find_by(followed_id: customer_id).destroy
 end

 def following?(customer)
     followings.include?(customer)
    #  include=対象の配列に因数が含まれていればtrueを返す。含まれていればフォローしている
 end

 def create_notification_follow(current_customer)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_customer.id, id, 'follow'])
    if temp.blank?
      notification = current_customer.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
 end
  # 同じ人が何回もフォローしても通知が来ないようにする

 def self.search(word)
  @customers = Customer.where("nickname LIKE ?","%#{word}%")
 end

 def current_user?(current_customer)
   id == current_customer.id
 end



end
