class CreateIdeaComments < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_comments do |t|
      t.text :idea_comment
      t.integer :user_id
      t.integer :idea_id
      t.timestamps
    end
  end
end
