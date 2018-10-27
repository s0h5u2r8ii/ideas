class CreateIdeaFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_favorites do |t|
      t.integer :user_id
      t.integer :idea_id
      t.timestamps
      t.index :user_id
      t.index :idea_id
      t.index [:user_id, :idea_id], unique: true
    end
  end
end
