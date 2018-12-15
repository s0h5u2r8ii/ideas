class WorkFavoritesController < ApplicationController
	after_action :create_work_notifications, only: [:create]


	def create
    @work = Work.find(params[:work_id])
    @work_favorite = WorkFavorite.create(user_id: current_user.id, work_id: @work.id)
    @work_favorite_hash ={}
    @work_favorite_hash[@work.id] = @work.id
  end

  def destroy
    @work = Work.find(params[:work_id])
    work_favorite = WorkFavorite.find_by(user_id: current_user.id, work_id: @work.id)
    work_favorite.destroy
    @work_favorite_hash ={}
   end

private
     def create_work_notifications
       @work = Work.find(params[:work_id])
       return if @work.user_id == current_user.id
       WorkNotification.create(user_id: @work.user_id,
       work_notified_by_id: current_user.id,
       work_id: @work.id, idea_id: @work.idea_id,
       work_notified_type: 'いいね')
     end
end
