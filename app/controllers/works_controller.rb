class WorksController < ApplicationController

    def new
        @idea = Idea.find(params[:idea_id])
        @work = Work.new
    end

    def show
        @idea = Idea.find(params[:id])
        @work = Work.find(params[:id])
        @user = @work.user
        @WorkComment = WorkComment.new
        if user_signed_in?
        @work_favorite_hash = WorkFavorite.where(user_id:current_user.id).pluck(:id,:@work_id).to_h
        end
    end

	def index
        if user_signed_in?
        @work_favorite_hash = WorkFavorite.where(user_id:current_user.id).pluck(:id,:work_id).to_h
        end
        if params[:order] != "like_count"
		@works = Work.order("id DESC")
        else
        @works = Work.find(WorkFavorite.group(:work_id).order('count(work_id) DESC').pluck(:work_id))
    end
	end

    def create
        idea = Idea.find(params[:idea_id])
        work = current_user.works.new(work_params)
        work.idea_id = idea.id
        work.save
    	redirect_to idea_path(idea)
    end


    private
  def work_params
    params.require(:work).permit(:work_title, :work_text, :user_id, :idea_id)
  end

end
