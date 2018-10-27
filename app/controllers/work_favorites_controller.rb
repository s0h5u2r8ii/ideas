class WorkFavoritesController < ApplicationController
	after_action :create_notifications, only: [:create]

	def create
    @work = Work.find(params[:work_id])
    @work_favorite = WorkFavorite.create(user_id: current_user.id, work_id: @work.id)
    @work_favorite_hash ={}
    @work_favorite_hash[@work.id] = @work.id
  end

  def destroy
    @i = Work.find(params[:idea_id])
    @work = Work.find(params[:work_id])
    work_favorite = WorkFavorite.find_by(user_id: current_user.id, work_id: @work.id)
    work_favorite.destroy
    @work_favorite_hash ={}
   end

private
     def create_notifications
       @work = Work.find(params[:work_id])
       return if @work.user_id == current_user.id
       Notification.create(user_id: @work.user_id,
        notified_by_id: current_user.id,
        work_id: @work.id, idea_id: @work.idea_id,
        notified_type: 'いいね')
     end
end
