class MessagesController < ApplicationController
before_action :authenticate_user!, :only => [:create]

  def create
        Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
        @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
        @e = Entry.where.not(user_id: current_user.id)
        @ee = @e.where(room_id: @message.room_id)
        @ee.each do |ee|
        MessageNotification.create(user_id: ee.user.id,
              message_notified_by_id: current_user.id,
              message_id: @message.id)
        redirect_to "/rooms/#{@message.room_id}"
        end
  end

  def destroy
        message = Message.find(params[:id])
        message.destroy
        redirect_back(fallback_location:room_path)
  end