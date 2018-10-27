class WorkComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :work, optional: true
	has_many :notifications, dependent: :destroy
end
