class CreateMessageNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :message_notifications do |t|
      t.references :user,index: true, foreign_key: true
      t.references :message,index: true, foreign_key: true
      t.references :message_notified_by, index: true
      t.boolean :message_read, default: false
      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
