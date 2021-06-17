class Customer::NotificationsController < ApplicationController

 def index
   @notifications = current_customer.passive_notifications
   @notifications.where(checked: false).each do |notification|
     notification.update_attributes(checked: true)
   end
 end

end
# 未確認の通知を受け取った後に、未確認→確認ずみになるように更新をしている
