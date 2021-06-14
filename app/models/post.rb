class Post < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :category
  belongs_to :customer
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :notifications, dependent: :destroy

  acts_as_taggable

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def create_notification_favorite(current_customer)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ?", current_customer.id, customer_id, id, 'favorite'])
    # すでにいいねされているか検索。同じ人が２回いいねする可能性があるため
    if temp.blank?
      notification = current_customer.active_notifications.new(
        post_id: id,
        visited_id: customer_id,
        action: 'favorite'
      )
      # いいねされいない場合のみ、通知レコードを作成
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment(current_customer, comment_id)
    temp_ids = Comment.select(:customer_id).where(post_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment(current_customer, comment_id, temp_id['customer_id'])
    end
    # 自分以外にコメントしている人を全て取得し、全員に通知を送る
    save_notification_comment(current_customer, comment_id, customer_id) if temp_ids.blank?
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
  end

  def save_notification_comment(current_customer, comment_id, visited_id)
     notification = current_customer.active_notifications.new(
       post_id: id,
       comment_id: comment_id,
       visited_id: visited_id,
       action: 'comment'
     )
    # コメントは複数回することが考えられるため、一つの投稿に複数回通知する
     if notification.visitor_id == notification.visited_id
       notification.checked = true
     end
     notification.save if notification.valid?
    # 自分の投稿に対するコメントの場合は、通知済みとする
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
end

