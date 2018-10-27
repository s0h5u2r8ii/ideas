class IdeasController < ApplicationController

    def show
    	@idea = Idea.find(params[:id])
    	@IdeaComment = IdeaComment.new
    	if user_signed_in?
        @idea_favorite_hash = IdeaFavorite.where(user_id:current_user.id).pluck(:id,:@idea_id).to_h
        end
    end

	def index
    if user_signed_in?
        @idea_favorite_hash = IdeaFavorite.where(user_id:current_user.id).pluck(:id,:idea_id).to_h
        end
    if params[:order] == "like_count"
        @ideas = Idea.find(IdeaFavorite.group(:idea_id).order('count(idea_id) desc').pluck(:idea_id))
    else
        @ideas = Idea.order("id DESC")
    end
  end

	def new
		    @idea = Idea.new
	end

	def create
        @idea = Idea.new(idea_params)
        @idea.user_id = current_user.id
        if @idea.save
        redirect_to ideas_path
        else
        redirect_to root_path
    end
	end

	def edit
        @idea = Idea.find(params[:id])
	end

	def update
        @idea = Idea.find(params[:id])
    if  @idea.update(idea_params)
        redirect_to idea_path(@idea.id)
    else
        @idea = Idea.find(params[:id])
        render :edit
    end
	end

	def destroy
		    @idea = Idea.find(params[:id])
		    @idea.destroy
		    redirect_to ideas_path
	end

	private

  def idea_params
        params.require(:idea).permit(:idea_title, :idea_text, :user_id)
  end

end
