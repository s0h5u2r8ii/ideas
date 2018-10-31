class CreateWorkFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :work_favorites do |t|
      t.integer :user_id
      t.integer :work_id
      t.timestamps
      t.index :user_id
      t.index :work_id
      t.index [:user_id, :work_id], unique: true
    end
  end
end
