class Admin::NotificationsController < ApplicationController
   def index
     @report = Notification.where(action: 'report')
   end
end


