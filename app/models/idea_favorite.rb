class IdeaFavorite < ApplicationRecord
	belongs_to :user
	belongs_to :idea
	has_many :notifications, dependent: :destroy
end
