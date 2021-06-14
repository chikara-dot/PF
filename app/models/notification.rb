class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  # デフォルトの並びを作成日時の降順で指定している
  belongs_to :post, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'Customer', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'Customer', foreign_key: 'visited_id', optional: true

  # 必要な情報以外はnilにするため、nilを許可するときは、optional: trueをする
end
