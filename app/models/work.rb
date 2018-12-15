class Work < ApplicationRecord
	belongs_to :user
	belongs_to :idea
	has_many :work_favorites, dependent: :destroy
	has_many :work_comments, dependent: :destroy
	has_many :work_notifications, dependent: :destroy
end
