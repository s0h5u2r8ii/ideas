class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :work_title
      t.text :work_text
      t.integer :user_id
      t.integer :idea_id
      t.timestamps
    end
  end
end
