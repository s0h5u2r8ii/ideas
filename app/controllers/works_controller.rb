class WorksController < ApplicationController

    def new
        @idea = Idea.find(params[:idea_id])
        @work = Work.new
    end

    def show
        @idea = Idea.find(params[:idea_id])
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
        @work = Work.find(WorkFavorite.group(:work_id).order('count(work_id) DESC').pluck(:work_id))
        @w = Work.left_outer_joins(:work_favorites).where(work_favorites: { id: nil })
        @works = @work + @w
    end
	end

    def create
        idea = Idea.find(params[:idea_id])
        work = current_user.works.new(work_params)
        work.idea_id = idea.id
        work.save
    	redirect_to idea_path(idea)
    end

    def edit
        @idea = Idea.find(params[:idea_id])
        @work = Work.find(params[:id])
    end

    def update
        @idea = Idea.find(params[:idea_id])
        @work = Work.find(params[:id])
    if  @work.update(work_params)
        redirect_to idea_work_path(@work.idea.id,@work.id)
    else
        @idea = Idea.find(params[:idea_id])
        @work = Work.find(params[:id])
        render :edit
    end
    end

    def destroy
            @idea = Idea.find(params[:idea_id])
            @work = Work.find(params[:id])
            @work.destroy
            redirect_to works_path
    end

    private

    def work_params
    params.require(:work).permit(:work_title, :work_text, :user_id, :idea_id)
    end

end
