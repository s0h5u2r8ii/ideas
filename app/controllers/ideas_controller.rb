class IdeasController < ApplicationController
    before_action :authenticate_user!, only:[:new,:show,:create,:update,:edit,:destroy]

    def show
    	@idea = Idea.find(params[:id])
    	@IdeaComment = IdeaComment.new
    	if user_signed_in?
        @idea_favorite_hash = IdeaFavorite.where(user_id:current_user.id).pluck(:id,:idea_id).to_h
        end
    end

	def index

     if user_signed_in?
        @idea_favorite_hash = IdeaFavorite.where(user_id:current_user.id).pluck(:id,:idea_id).to_h
        end
     if params[:order] == "like_count"
        @idea = Idea.find(IdeaFavorite.group(:idea_id).order('count(idea_id) desc').pluck(:idea_id))
        @i = Idea.left_outer_joins(:idea_favorites).where(idea_favorites: { id: nil })
        @ideas = @idea + @i
     else
        @ideas = Idea.order("id DESC")
     end
    end

	def new
		@idea = Idea.new
        @N = current_user.notifications.where(read: false).order('created_at DESC')
        @M = current_user.message_notifications.where(message_read: false).order('created_at DESC')
        @No = (@N + @M).sort_by {|rrr|rrr.created_at}.reverse!
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
