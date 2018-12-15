class WorkFavorite < ApplicationRecord
	belongs_to :user
	belongs_to :work
	has_many :work_notifications, dependent: :destroy
end
