class WorkFavorite < ApplicationRecord
	belongs_to :user
	belongs_to :work
	has_many :notifications, dependent: :destroy
end
