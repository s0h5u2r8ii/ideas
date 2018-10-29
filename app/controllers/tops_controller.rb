class TopsController < ApplicationController
  def top
  	@idea = Idea.order("id DESC").limit(10)
    @idearanking = Idea.find(IdeaFavorite.group(:idea_id).order('count(idea_id) desc').pluck(:idea_id))
    @ideafirst = @idearanking.first
    @ideasecond = @idearanking.second
    @ideathird = @idearanking.third
    @workranking = Work.find(WorkFavorite.group(:work_id).order('count(work_id) DESC').pluck(:work_id))
    @workfirst = @workranking.first
    @worksecond = @workranking.second
    @workthird = @workranking.third
  end

  def about
  end
end
