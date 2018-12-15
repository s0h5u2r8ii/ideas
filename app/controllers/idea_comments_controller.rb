class IdeaCommentsController < ApplicationController
  before_action :authenticate_user!
after_action :create_notifications, only: [:create]

	def create
	idea = Idea.find(params[:idea_id])
    ideacomment = current_user.idea_comments.new(idea_comment_params)
    ideacomment.idea_id = idea.id
    ideacomment.save
    redirect_to idea_path(idea)
    end

  def destroy
    @idea = Idea.find(params[:idea_id])
    ideacomment = IdeaComment.find(params[:format])
    ideacomment.destroy
    redirect_to idea_path(@idea.id)
  end

private
    def idea_comment_params
		params.require(:idea_comment).permit(:user_id,:idea_id,:idea_comment)
	end

     def create_notifications
       @idea = Idea.find(params[:idea_id])
       @idea_comment = @idea.idea_comments.last(1)
       return if @idea.user_id == current_user.id
       Notification.create(user_id: @idea.user_id,
        notified_by_id: current_user.id,
        idea_id: @idea.id,
        notified_type: 'コメント')
     end
end
