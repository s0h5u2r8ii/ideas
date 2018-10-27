class NotificationsController < ApplicationController

  def index
     @notifications = current_user.notifications
    end

   def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    if @notification.work.id == 1
     redirect_to idea_path @notification.idea
   else
     redirect_to idea_work_path(@notification.work.id,@notification.work.idea.id)
   end
 end
end


























#   def link_through
#     @notification = Notification.where(user_id: current_user.id).order("id DESC")
#     @idea = @notification.where(idea_id: true)
#     @work = @notification.where(work_id: true)
#     @message = @notification.where(message_id: true)
#     @notification.each do |notification|
#       notification.update read: true

#     if notification.idea_id.present? && notification.work_id.present? then
#      redirect_to idea_path notification.idea and return

#    elsif notification.work_id.present? then
#      redirect_to idea_work_path notification.work and return
#   end
#  end
# end
# end














#   	@notification = Notification.find(params[:id])
#   	@a = Notification.where(user_id: current_user.id, idea_id: true)
#   	@b = Notification.where(user_id: current_user.id, work_id: true)
#   	@c = Notification.where(user_id: current_user.id, message_id: true)
#   	@notification.update read: true
#   	if @a then
#   		@a.each do |aa|
#   		redirect_to idea_path (aa.idea.id) and return
#   	end
#   	elsif
#   	   @b then
#   	   @b.each do |bb|
#   	   redirect_to idea_work_path (bb.work.id) and return
#   	end
#   	elsif
#   	   @c
#   	   @c.each do |cc|
#   	   redirect_to room_path (cc.id) and return
#   	end
#   	end
#   end
# end

   	# @notification.each do |notification|
    #  notification.update read: true
    # if notification.idea_id.present? then
    #      redirect_to idea_path (notification.idea) and return
    #  elsif
    #     notification.work_id.present? then
    #      redirect_to idea_work_path (notification.work.id) and return
    #  elsif
    #     notification.message_id.present?
    #     @notifications = Notification.where(user_id: current_user.id)
    #     @notifications.each do |notifications|
    #     @message = Message.where(user_id: notifications.notified_by_id)
    #     @message.each do |message|
    #    	@p = message.room
    #      redirect_to room_path (@p.id) and return
    #  end
    #  end
    #  end
    # end
    # end
