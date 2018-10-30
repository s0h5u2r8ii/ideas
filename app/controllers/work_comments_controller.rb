class WorkCommentsController < ApplicationController
    before_action :authenticate_user!
	after_action :create_notifications, only: [:create]

	def create
	idea = Idea.find(params[:idea_id])
	work = Work.find(params[:work_id])
    workcomment = current_user.work_comments.new(work_comment_params)
    workcomment.work_id = work.id
    workcomment.save
    redirect_to idea_work_path(idea.id,work.id)
    end

    def destroy
        @work = Work.find(params[:work_id])
        workcomment = WorkComment.find(params[:format])
        workcomment.destroy
        redirect_to idea_work_path(@work.idea.id,@work.id)
    end

    private

    def work_comment_params
		params.require(:work_comment).permit(:user_id,:work_id,:work_comment)
	end

    def create_notifications
       @work = Work.find(params[:work_id])
       return if @work.user_id == current_user.id
       Notification.create(user_id: @work.user_id,
        notified_by_id: current_user.id,
        work_id: @work.id, idea_id: @work.idea_id,
        notified_type: 'コメント')
     end
end
