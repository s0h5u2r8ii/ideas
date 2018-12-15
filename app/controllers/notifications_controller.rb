class NotificationsController < ApplicationController

  def index
    @N = current_user.notifications.where(read: false).order('created_at DESC')
    @M = current_user.message_notifications.where(message_read: false).order('created_at DESC')
    @No = (@N + @M).sort_by {|rrr|rrr.created_at}.reverse!
     @notifications = current_user.notifications
    end

   def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
     redirect_to idea_path @notification.idea
 end
end