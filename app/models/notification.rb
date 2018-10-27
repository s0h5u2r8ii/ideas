class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: 'User'
  belongs_to :user, optional: true
  belongs_to :idea, optional: true
  belongs_to :work, optional: true
end
