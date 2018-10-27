class Idea < ApplicationRecord
	belongs_to :user
	has_many :works
	has_many :idea_favorites, dependent: :destroy
	has_many :idea_comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	 def idea_favorited_by?(user)
          idea_favorites.where(user_id: user.id).exists?
     end


end
