class MessagenotificationsController < ApplicationController

   def message_link_through
    @messagenotification = MessageNotification.find(params[:id])
    # @messagenotification.each do |messagenotification|
    @messagenotification.update message_read: true
     redirect_to room_path @messagenotification.message.room
 end
end

