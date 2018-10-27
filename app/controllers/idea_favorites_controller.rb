class IdeaFavoritesController < ApplicationController
	after_action :create_notifications, only: [:create]

  def create
    @idea = Idea.find(params[:idea_id])
    @idea_favorite = IdeaFavorite.create(user_id: current_user.id, idea_id: @idea.id)
    @idea_favorite_hash ={}
    @idea_favorite_hash[@idea.id] = @idea.id

  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    idea_favorite = IdeaFavorite.find_by(user_id: current_user.id, idea_id: @idea.id)
    idea_favorite.destroy
    @idea_favorite_hash ={}

   end

   private
     def create_notifications
     	@idea = Idea.find(params[:idea_id])
       return if @idea.user_id == current_user.id
       Notification.create(user_id: @idea.user_id,
        notified_by_id: current_user.id,
        idea_id: @idea.id,
        notified_type: 'いいね',
        work_id: 1)
     end
end
