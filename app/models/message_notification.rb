class MessageNotification < ApplicationRecord
	belongs_to :message_notified_by, class_name: 'User'
    belongs_to :user, optional: true
    belongs_to :message, optional: true
end
