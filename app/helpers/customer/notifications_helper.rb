module Customer::NotificationsHelper
  def notification_action_message(action)
    case action
    when "report"
      "あなたの投稿が通報されました"
    when "follow"
      "あなたをフォローしました"
    when "favorite"
      "あなたの投稿にいいねしました!!!"
    when "comment"
      "あなたの投稿にコメントしました"

    end
  end
end
