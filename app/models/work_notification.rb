class WorkNotification < ApplicationRecord
  belongs_to :user
  belongs_to :work_notified_by, class_name: 'User'
  belongs_to :work
  belongs_to :work_favorite, optional: true
end
