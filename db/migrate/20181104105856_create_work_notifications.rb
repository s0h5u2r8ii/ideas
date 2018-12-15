class CreateWorkNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :work_notifications do |t|
      t.references :user,index: true, foreign_key: true
      t.references :work_notified_by, index: true
      t.references :idea,index: true, foreign_key: true
      t.references :work,index: true, foreign_key: true
      t.references :work_favorite,index: true, foreign_key: true
      t.references :work_comment,index: true, foreign_key: true
      t.string :work_notified_type
      t.boolean :work_read, default: false
      t.timestamps
    end
    add_foreign_key :work_notifications, :users, column: :work_notified_by_id
    end
end
