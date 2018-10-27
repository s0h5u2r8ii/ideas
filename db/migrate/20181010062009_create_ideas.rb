class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :idea_title
      t.text :idea_text
      t.integer :user_id
      t.timestamps
    end
  end
end
