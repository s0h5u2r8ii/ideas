class MessagesController < ApplicationController
before_action :authenticate_user!, :only => [:create]
after_action :create_message_notifications, only: [:create]

  def create
      Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
  end

  def destroy
      message = Message.find(params[:id])
      message.destroy
      redirect_back(fallback_location:room_path)
  end

private
  def create_message_notifications
      @CurrentUserEntr = Entry.where(user_id: current_user.id)
       @UserEntr = Entry.where.not(user_id: current_user.id)
        @CurrentUserEntr.each do |ccue|
         @UserEntr.each do |uue|
          if ccue.room.id = uue.room.id
           @message = Message.where(room_id: uue.room.id, user_id: current_user.id).last(1)
            @message.each do |message|
             MessageNotification.create(user_id: uue.user.id,
              message_notified_by_id: ccue.user.id,
              message_id: message.id)
            end
          end
         end
        end
  end
end