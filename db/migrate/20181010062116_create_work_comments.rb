class CreateWorkComments < ActiveRecord::Migration[5.2]
  def change
    create_table :work_comments do |t|
      t.text :work_comment
      t.integer :user_id
      t.integer :work_id
      t.timestamps
    end
  end
end
