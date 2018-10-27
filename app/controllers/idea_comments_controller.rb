class IdeaCommentsController < ApplicationController
after_action :create_notifications, only: [:create]

	def create
	idea = Idea.find(params[:idea_id])
    ideacomment = current_user.idea_comments.new(idea_comment_params)
    ideacomment.idea_id = idea.id
    ideacomment.save
    redirect_to idea_path(idea)
    end

private
    def idea_comment_params
		params.require(:idea_comment).permit(:user_id,:idea_id,:idea_comment)
	end

     def create_notifications
       @idea = Idea.find(params[:idea_id])
       return if @idea.user_id == current_user.id
       Notification.create(user_id: @idea.user_id,
        notified_by_id: current_user.id,
        idea_id: @idea.id,
        notified_type: 'コメント')
     end
end