class IdeaComment < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :idea, optional: true
	has_many :notifications, dependent: :destroy
end
