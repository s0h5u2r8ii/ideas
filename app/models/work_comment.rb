class WorkComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :work, optional: true
	has_many :work_notifications, dependent: :destroy
end
