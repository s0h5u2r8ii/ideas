class TopsController < ApplicationController
  def top
  	@idea = Idea.order("id DESC").limit(10)
    @idearanking = Idea.find(IdeaFavorite.group(:idea_id).order('count(idea_id) desc').pluck(:idea_id))
    @workranking = Work.find(WorkFavorite.group(:work_id).order('count(work_id) DESC').pluck(:work_id))
  end

  def about
  end
end
