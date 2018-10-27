class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user,index: true, foreign_key: true
      t.references :notified_by, index: true
      t.references :idea,index: true, foreign_key: true
      t.references :idea_favorite,index: true, foreign_key: true
      t.references :idea_comment,index: true, foreign_key: true
      t.references :work,index: true, foreign_key: true
      t.references :work_favorite,index: true, foreign_key: true
      t.references :work_comment,index: true, foreign_key: true
      t.string :notified_type
      t.boolean :read, default: false

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
    end
  end

